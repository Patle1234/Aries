import 'package:flutter/material.dart';
import 'package:aries/components/my_button.dart';
import "package:aries/components/my_textfield.dart";
import 'package:aries/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

// import 'package:my_app/components/my_button.dart';
// import 'package:my_app/components/my_textfield.dart';
// import 'package:lib/components/square_tile.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    //loading
    showDialog(
      context:context,
      builder:(context){
        return const Center(child: CircularProgressIndicator(),
        );
    },); 

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword
      (email: emailController.text,
      password: passwordController.text
      );
      //end loading
      Navigator.pop(context);

    } on FirebaseAuthException catch(e){
      //end loading
      Navigator.pop(context);
      showAuthErrorMsg(e.code);
 
    }


  }

  void showAuthErrorMsg(String msg){
    showDialog(
      context:context,
      builder:(context){
        return AlertDialog(
          title:Text(msg)
        );
      }
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const SizedBox(height: 50),
          
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
          
                const SizedBox(height: 50),
          
                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
          
                const SizedBox(height: 10),
          
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          
                const SizedBox(height: 10),
          
                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // sign in button
                MyButton(
                  text:"Sign In",
                  onTap: signUserIn,
                ),
          
                const SizedBox(height: 50),
          
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
          
                const SizedBox(height: 25),
          
                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //TODO: google button
                    SquareTile(imagePath: '/Users/dpatel/Desktop/Aries/my_app/lib/images/google.png',onTap: ()=> AuthService().signInWithGoogle()),
          
                    SizedBox(width: 25),
          
                    //TODO: apple button
                    SquareTile(imagePath: '/Users/dpatel/Desktop/Aries/my_app/lib/images/apple.png',onTap:()=>{})
                  ],
                ),
          
                const SizedBox(height: 25),
          
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}