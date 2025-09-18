import 'package:flutter/material.dart';
import 'package:quiz/landingpage.dart';
import 'package:quiz/quizPage.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizApp();
  }
}

class _QuizApp extends State<QuizApp> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = Landingpage(change);
    super.initState();
  }

  void change() {
    setState(() {
      activeScreen = QuizPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: activeScreen);
  }
}
