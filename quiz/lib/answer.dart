import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/summarypage.dart';
import 'quizPage.dart';
import 'data/data.dart';

class Answer extends StatelessWidget {
  final String? name;
  final List<String> answers;
  const Answer({super.key, required this.name, required this.answers});

  List<Map<String, Object>> getSummary() {
    String optionscolor = '';
    String bgcolor = '';
    String txtcolor = '';
    String icon = '';
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == data[i].options[0]) {
        bgcolor = '#DCDCDC';
        txtcolor = '#000000';
        optionscolor = '#F3F2EC';
        icon = 'right';
      } else {
        bgcolor = '#E62727';
        txtcolor = '#F3F2EC';
        optionscolor = '#E62727';
        icon = 'wrong';
      }
      summary.add({
        'index': i,
        'question': data[i].ques,
        'correct-answer': data[i].options[0],
        'choosen-answer': answers[i],
        'bgcolor': bgcolor,
        'txtcolor': txtcolor,
        'options-color': optionscolor,
        'icon': icon,
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
              Text(
                'Hey, $name\nyou scored: $score',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              SummaryPage(getSummary()),
            ],
          ),
        ),
      ),
    );
  }
}
