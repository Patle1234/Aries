import 'package:aries/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aries/components/my_button.dart';
import "package:aries/components/my_textfield.dart";
import 'package:aries/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'package:flutter/cupertino.dart';

// import 'package:my_app/components/my_button.dart';
// import 'package:my_app/components/my_textfield.dart';
// import 'package:lib/components/square_tile.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  int heightController=36;
  int weightController =10;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // sign user in method
  void signUserUp() async {
    //loading
    showDialog(
      context:context,
      builder:(context){
        return const Center(child: CircularProgressIndicator(),
        );
    },); 

    try{
      if(passwordController.text==confirmpasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword
        (
          email: emailController.text,
          password: passwordController.text
        );
        
        addUserDetails(usernameController.text, emailController.text, weightController, heightController);

      }else{
        showDialog(
          context:context,
          builder:(context){
          return AlertDialog(
            title:Text("Your password is doesn't match")
         );
          }
        );
      }
      //end loading
      Navigator.pop(context);

    } on FirebaseAuthException catch(e){
      //end loading
      Navigator.pop(context);
      showAuthErrorMsg(e.code);
 
    }
  }

  Future addUserDetails(String username,String email, int weight,int height) async{
    await FirebaseFirestore.instance.collection('users').add({
      'username':username,
      'email':email,
      'height':height,
      'weight': weight
    });
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
                const SizedBox(height: 15),
          
                // create account text
                Text(
                  'Hello, let\'s create an account!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize:25,
                    fontWeight: FontWeight.bold,
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


                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height:20 ),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
          
                const SizedBox(height:20 ),
          
                // password textfield
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                
                const SizedBox(height: 20),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton.filled(
                    child:Text("Height: $heightController in"),
                    onPressed: ()=>showCupertinoModalPopup(context: context, builder: (_)=>SizedBox(
                    width: double.infinity, 
                    height:250,
                    child: CupertinoPicker(
                      backgroundColor:Colors.white, 
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(
                        initialItem: 1,
                      ),
                      children:[
                        for (var i = 36; i <= 84; i++) Text("$i in")
                      ],
                      onSelectedItemChanged: (int value){
                        setState(() {
                          heightController=value+36;
                        });
                      }, 
                
                    ))),
                
                  ),
                ), 

                const SizedBox(height: 5),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: CupertinoButton.filled(
                    child:Text("Weight: $weightController lb"),
                    onPressed: ()=>showCupertinoModalPopup(context: context, builder: (_)=>SizedBox(
                    width: double.infinity, 
                    height:250,
                    child: CupertinoPicker(
                      backgroundColor:Colors.white, 
                      itemExtent: 30,
                      scrollController: FixedExtentScrollController(
                        initialItem: 1,
                      ),
                      children:[
                        for (var i = 10; i <= 350; i++) Text("$i lb")
                      ],
                      onSelectedItemChanged: (int value){
                        setState(() {
                          weightController=value+10;
                        });
                      }, 
               
                    ))),
               
                  ),
               ), 
          
                const SizedBox(height: 15),
          
                // sign up button
                MyButton(
                  text:"Sign Up",
                  onTap: signUserUp,
                ),
          
                const SizedBox(height: 15),
          
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
          
                const SizedBox(height: 10),
          
                // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     //TODO: google button
                //     SquareTile(imagePath: '/Users/dpatel/Desktop/Aries/my_app/lib/images/google.png',onTap:()=>AuthService().signInWithGoogle()),
          
                //     SizedBox(width: 10),
          
                //     //TODO: apple button
                //     SquareTile(imagePath: '/Users/dpatel/Desktop/Aries/my_app/lib/images/apple.png',onTap:()=>{})
                //   ],
                // ),
          
                // const SizedBox(height: 10),
          
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
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