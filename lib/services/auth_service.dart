import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

const errorText = 'Something went wrong';

final firebaseServise =
    RM.inject<FirebaseService>(() => FirebaseService(), onInitialized: (s) {
  s!.init();
}, isLazy: false);

class FirebaseService {
  late final FirebaseAuth? auth;
  String verificationId = '';

  init() async {
    await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    firebaseServise.notify();
  }

  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Function onComplete,
      required Function(String) onCodeSent,
      required Function(String) onError}) async {
    await auth!.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        UserCredential userCredential = await signInWithCredential(credential);
        User? user = getUserWithCreds(userCredential);
        if (user != null) {
          onComplete();
        } else {
          onError(errorText);
        }
      },
      verificationFailed: (exception) {
        debugPrint(exception.message);
        onError(exception.message ?? errorText);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId = verificationId;
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        debugPrint(verificationId);
        debugPrint('Timeout');
      },
    );
  }

  Future<void> confirmCode(
      String code, Function onComplete, Function(String) onError) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    UserCredential creds = await signInWithCredential(credential);

    User? user = getUserWithCreds(creds);

    if (user != null) {
      onComplete();
    } else {
      onError(errorText);
    }
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await auth!.signInWithCredential(credential);
  }

  User? getUserWithCreds(UserCredential credential) {
    return credential.user;
  }
}
