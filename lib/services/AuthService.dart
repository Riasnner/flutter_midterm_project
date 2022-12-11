import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService{
  static GoogleSignIn googleSignIn = GoogleSignIn();
  final storage = new FlutterSecureStorage();

  GoogleSignInAccount? user; 

  Future <UserCredential> signInEmailPass(email, password) async{
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );

    await storage.write(key: 'token', value: user.user?.uid);

    return user;
  }

  Future <UserCredential> signUpEmailPass(email, password) async{
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    
    return user;
  }

  Future <UserCredential> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken
    );

    await storage.write(key: 'token', value: googleAuth?.accessToken);
    // String? value = await storage.read(key: 'token');
    // print("this is the access token");
    // print(value);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async{
    try{
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    }catch(e){
      return null;
    }
  }
}