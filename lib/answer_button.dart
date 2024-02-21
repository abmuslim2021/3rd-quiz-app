import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onTap, required this.answerText});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
        ),
        child: Text(answerText, textAlign: TextAlign.center,),
      ),
    );
  }
}
