import 'package:firebase_auth/firebase_auth.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final firebaseServise = RM.inject<FirebaseService>(() => FirebaseService());

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithPhone(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) {},
      verificationFailed: (exception) {},
      codeSent: (verificationId, resendToken) {},
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
