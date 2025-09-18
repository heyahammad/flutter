import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/summarypage.dart';
import 'quizPage.dart';
import 'data/data.dart';

class Answer extends StatelessWidget {
  final String? name;
  final List<String> answers;
  const Answer({super.key, required this.name, required this.answers});

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < answers.length; i++) {
      summary.add({
        'index': i,
        'question': data[i].ques,
        'correct-answer': data[i].options[0],
        'choosen-answer': answers[i],
      });
    }
    return summary;
  }

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
              SummaryPage(getSummary()),
              // Text(
              //   'Congratulation! \n $name \nYou Completed Your Quiz',
              //   style: TextStyle(color: Colors.white, fontSize: 36),
              //   textAlign: TextAlign.center,
              // ),
              // Text(
              //   'Your Score is $score',
              //   style: TextStyle(color: Colors.white, fontSize: 36),
              //   textAlign: TextAlign.center,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
