import 'package:flutter/material.dart';
import 'package:quiz/quizPage.dart';

class Ques extends StatefulWidget {
  const Ques({super.key});
  @override
  State<Ques> createState() => _Ques();
}

class _Ques extends State<Ques> {
  SearchType ans;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gra),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'What is Dart?',
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
              ),
              SizedBox(height: 20),
              Radio<>
            ],
          ),
        ),
      ),
    );
  }
}
