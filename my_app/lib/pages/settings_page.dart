import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:
        Text("Logged in with" + FirebaseAuth.instance.currentUser!.email!,
        style:TextStyle(fontSize:20))
      ); 
  }
}