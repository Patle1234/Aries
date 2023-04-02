import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class EmotionSelect extends StatelessWidget {
  String emoji="";
  int color=500;
  Color myColor = Colors.purple;

  EmotionSelect({super.key, required this.emoji, required this.myColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:myColor,
        shape: BoxShape.rectangle,
        borderRadius:BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(12),
      child: Text(
        emoji,
        style:TextStyle(
          fontSize:40
        ),
        ),
    );
  }
}