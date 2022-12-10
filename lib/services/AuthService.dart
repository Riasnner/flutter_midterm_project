import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  static GoogleSignIn googleSignIn = GoogleSignIn();

  GoogleSignInAccount? user;

  // Future<User> handleSignUp(email, password) async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;

  //   UserCredential result = await auth.createUserWithEmailAndPassword(
  //       email: email, password: password);
  //   final User user = result.user!;

  //   return user;
  // }

  Future <UserCredential> signInWithGoogle() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken
    );

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