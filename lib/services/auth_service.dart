import 'package:firebase_auth/firebase_auth.dart';

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
