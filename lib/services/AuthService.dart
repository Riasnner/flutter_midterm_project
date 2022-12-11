import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService{
  static GoogleSignIn googleSignIn = GoogleSignIn();
  final storage = const FlutterSecureStorage();

  GoogleSignInAccount? user; 

  Future <UserCredential> signInEmailPass(var email, var password) async{
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );

    await storage.write(key: 'token', value: user.user?.uid);

    return user;
  }

  Future <UserCredential> signUpEmailPass(var email, var password) async{
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    
    return user;
  }

  Future readData(String token) async{
    var data = await storage.read(key: token);
    return data;
  }

  Future <UserCredential> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken
    );

    await storage.write(key: 'token', value: googleAuth?.accessToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async{
    try{
      if (googleSignIn.currentUser != null){
        await googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();}
      else{
        await googleSignIn.signOut();
        await FirebaseAuth.instance.signOut();}
      await storage.delete(key: 'token');
    }catch(e){
      return null;
    }
  }
}