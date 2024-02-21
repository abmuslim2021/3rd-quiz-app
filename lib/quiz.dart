import 'package:flutter/material.dart';
import 'package:third_quizz_app/data/questions.dart';
import 'package:third_quizz_app/questions_screen.dart';
import 'package:third_quizz_app/start_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_page';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState((){
        selectedAnswers=[];
        activeScreen='start_page';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartPage(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizz App'),
        ),
        backgroundColor: Colors.red,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 2, 55, 125),
                Color.fromARGB(255, 9, 81, 176),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
