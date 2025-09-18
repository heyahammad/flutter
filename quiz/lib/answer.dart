import 'package:flutter/material.dart';
import 'quizPage.dart';

class Answer extends StatelessWidget {
  final String? name;

  const Answer({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    int score = 0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gra),
        child: Padding(
          padding: EdgeInsetsGeometry.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congratulation! \n $name \nYou Completed Your Quiz',
                style: TextStyle(color: Colors.white, fontSize: 36),
                textAlign: TextAlign.center,
              ),
              Text(
                'Your Score is $score',
                style: TextStyle(color: Colors.white, fontSize: 36),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
