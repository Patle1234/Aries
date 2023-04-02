 import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
//google sign 

  signInWithGoogle() async{
    //begin sign in process
    final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
     

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth=await gUser!.authentication;

    //create new credentials for Users
    final credentials= GoogleAuthProvider.credential(
      accessToken:gAuth.accessToken,
      idToken:gAuth.idToken,
    );
    //sign in user 

    return await FirebaseAuth.instance.signInWithCredential(credentials);



  }

 }