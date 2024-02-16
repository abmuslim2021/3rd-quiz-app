import 'package:flutter/material.dart';
import 'package:third_quizz_app/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizz App'),
        ),
        backgroundColor: Colors.red,
        body: const StartPage(),
      ),
    );
  }
}