import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:aries/components/emotion_select.dart';
import 'package:aries/components/goal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EntryPage extends StatefulWidget {
  EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final emojiColor = List<int>.filled(5, 500); // Creates fixed-length list.
  var emojiSelect = "";
  TextEditingController textarea = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  var userID = "j";
  var testText1 = TextEditingController();
  // final List<<Goal>> goals = [
  //   {"goalName": "Goal 1", "text": TextEditingController()},
  //   {"goalName": "Goal 2", "text": TextEditingController()}
  // ];
  @override
  void initState() {
    getUsernameID();
    super.initState();
  }

  emojiClick(int index) {
    emojiColor.setAll(1, [500]);
    emojiColor[0] = 500;
    emojiColor[1] = 500;
    emojiColor[2] = 500;
    emojiColor[3] = 500;
    emojiColor[4] = 500;

    print(emojiColor);
    setState(() {
      emojiColor[index] = 300;
    });
  }

//String _productName, String _productPrice, String _imageUrl, bool _isFavourite.   List<String> entries
  Future<void> uploadEntry(String id, String entries, String emoji) async {
    await FirebaseFirestore.instance.collection("entries").add({
      'emoji': emoji,
      'goals': entries,
      'createdOn': FieldValue.serverTimestamp(),
      'userID': userID,
    });
  }

  Future getUsernameID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            print(element.reference.id);
            userID = element.reference.id;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How do you feel today?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Row(
                children: [
                  new GestureDetector(
                      onTap: () {
                        emojiClick(0);
                        emojiSelect = "😀";
                      },
                      child: new Column(
                        children: [
                          EmotionSelect(
                              emoji: "😀",
                              myColor: Colors.purple[emojiColor[0]]!),
                          Text("Happy")
                        ],
                      )),
                  SizedBox(width: 10),
                  new GestureDetector(
                      onTap: () {
                        emojiClick(1);
                        emojiSelect = "😥";
                      },
                      child: new Column(
                        children: [
                          EmotionSelect(
                              emoji: "😥",
                              myColor: Colors.purple[emojiColor[1]]!),
                          Text("Sad")
                        ],
                      )),
                  SizedBox(width: 10),
                  new GestureDetector(
                      onTap: () {
                        emojiClick(2);
                        emojiSelect = "😡";
                      },
                      child: new Column(
                        children: [
                          EmotionSelect(
                              emoji: "😡",
                              myColor: Colors.purple[emojiColor[2]]!),
                          Text("Mad")
                        ],
                      )),
                  SizedBox(width: 10),
                  new GestureDetector(
                      onTap: () {
                        emojiClick(3);
                        emojiSelect = "😕";
                      },
                      child: new Column(
                        children: [
                          EmotionSelect(
                              emoji: "😕",
                              myColor: Colors.purple[emojiColor[3]]!),
                          Text("Meh")
                        ],
                      )),
                  SizedBox(width: 10),
                  new GestureDetector(
                      onTap: () {
                        emojiClick(4);
                        emojiSelect = "😰";
                      },
                      child: new Column(
                        children: [
                          EmotionSelect(
                              emoji: "😰",
                              myColor: Colors.purple[emojiColor[4]]!),
                          Text("Tired")
                        ],
                      )),
                ],
              ),

              SizedBox(height: 15),
              Goal(goalName: "Test Goal 1", text: testText1),
              SizedBox(height: 15),
              // Goal(goalName: "Test Goal 2"),
              // SizedBox(height: 30),

              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  uploadEntry(userID, testText1.text, emojiSelect);
                },
                child: Text("upload the text entry"),
              )
            ]),
      )),
    ));
  }
}
