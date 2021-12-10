import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final firebaseServise =
    RM.inject<FirebaseService>(() => FirebaseService(), onInitialized: (s) {
  print('Initialized');
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
      required Function(String) onCodeSent}) async {
    await auth!.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        UserCredential userCredential = await signInWithCredential(credential);
        User? user = getUserWithCreds(userCredential);
        print(user);
        if (user != null) {
          onComplete();
        }
      },
      verificationFailed: (exception) {
        print(exception.message);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId = verificationId;
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print(verificationId);
        print('Timeout');
      },
    );
  }

  Future<void> confirmCode(String code, Function onComplete) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    UserCredential creds = await signInWithCredential(credential);

    User? user = getUserWithCreds(creds);

    if (user != null) {
      onComplete();
    }
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await auth!.signInWithCredential(credential);
  }

  User? getUserWithCreds(UserCredential credential) {
    return credential.user;
  }
}
