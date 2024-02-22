import 'package:flutter/material.dart';
import 'package:third_quizz_app/data/questions.dart';
import 'package:third_quizz_app/questions_summary.dart';
import 'package:third_quizz_app/quiz.dart';


class RestartQuizButton extends StatefulWidget {
  @override
  _RestartQuizButtonState createState() => _RestartQuizButtonState();
  
}

class _RestartQuizButtonState extends State<RestartQuizButton> {
  var activeS = 'questions-screen';

  void switchS() {
    setState(() {
      activeS = 'start_page';
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>const Quiz()));
      },
      style: TextButton.styleFrom(foregroundColor: Colors.white),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.refresh),
          SizedBox(
            width: 8,
          ),
          Text('Restart Quiz'),
        ],
      ),
    );
  }
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.choosenAnswers,
  });

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions.',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            RestartQuizButton(), // Use the new RestartQuizButton widget here
          ],
        ),
      ),
    );
  }
}
