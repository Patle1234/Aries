import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './home_page.dart';
import './login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges() ,
          builder:(context, snapshot){
            if(snapshot.hasData){//user logged in
              return HomePage();
            }else{//user not logged in
              return LoginOrRegisterPage();
            }
          }
      )
    );
  }
}