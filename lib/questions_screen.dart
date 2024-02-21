import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_quizz_app/answer_button.dart';
import 'package:third_quizz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 195, 224, 255),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),

              textAlign: TextAlign.center, // Align text to center
            ),
            const SizedBox(
              height: 25,
            ),
            ...currentQuestion.getShuffledList().map((answer) {
              return AnswerButton(
                onTap: (){
                  answerQuestion(answer); 
                },
                answerText: answer,
              );
            })
          ],
        ),
      ),
    );
  }
}
