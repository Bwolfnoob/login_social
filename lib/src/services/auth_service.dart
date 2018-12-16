import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firebase = FirebaseAuth.instance;

  Future<bool> signWithPhone(String verificacaoId, String smsCode) async {
    final loginResult = await _firebase.signInWithPhoneNumber(
        verificationId: verificacaoId, smsCode: smsCode);
    if (loginResult?.uid != null) {
      return true;
    } else {
      return false;
    }
  }

  Future verifyPhoneNumber(String numeroCelular) async {
    //FirebaseAuth.instance.setLanguageCode(language);
    await _firebase.verifyPhoneNumber(
        phoneNumber: numeroCelular,
        codeSent: (String verified, [int forceResend]) {
          print("Verificado com sucesso");
          print(verified);
        },
        verificationFailed: (
          AuthException authException,
        ) {
          print("Ocorreu um erro");
        },
        verificationCompleted: (FirebaseUser firebaseUser) {
          print(firebaseUser.uid);
        },
        codeAutoRetrievalTimeout: (String timeout) {
          print(timeout);
        },
        timeout: Duration(seconds: 30));
  }
}
