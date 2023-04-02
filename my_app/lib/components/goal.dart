import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  String goalName = "";
  TextEditingController text = TextEditingController();

  Goal({super.key, required this.goalName,required this.text});

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(children: [
      Text(widget.goalName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: widget.text,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Enter Remarks",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.purple),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.purple),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        ),
      )
    ])));
  }
}
