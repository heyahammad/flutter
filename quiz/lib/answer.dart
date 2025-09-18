import 'package:flutter/material.dart';
import 'quizPage.dart';
import 'data/data.dart';

class Answer extends StatelessWidget {
  final String? name;
  final List<String> answers;
  const Answer({super.key, required this.name, required this.answers});

  @override
  Widget build(BuildContext context) {
    int score = 0;

    for (int i = 0; i <= answers.length - 1; i++) {
      var correct = data[i];
      if (answers[i] == correct.options[0]) {
        score++;
      }
    }

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
