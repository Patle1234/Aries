import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'get_username.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    //document IDs
    List<String> docIds = [];

    Future getUsernameID() async {
      await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((element) {
              print(element.reference);
              docIds.add(element.reference.id);
            }),
          );
    }

    @override
    void initState() {
      getUsernameID();
      super.initState();
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [




                      

  
        ],
      ),
    );
  }
}
