import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/kustomButton.dart';
import 'package:quiz/quizPage.dart';
import 'data/data.dart';
import 'answer.dart';

String? selected;

class Ques extends StatefulWidget {
  const Ques({super.key});
  @override
  State<Ques> createState() => _Ques();
}

class _Ques extends State<Ques> {
  var quesNo = 0;

  var answers = [];

  void qusChange(String op) {
    setState(() {
      if (quesNo < data.length - 1) {
        quesNo++;
        answers.add(op);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentques = data[quesNo];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(gradient: gra),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsetsGeometry.fromLTRB(10, 0, 0, 0),
                child: Text(
                  textAlign: TextAlign.left,
                  currentques.ques,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // for (int i = 0; i < 4; i++)
            ...currentques.shuffledOptions().map((options) {
              return KustomButton(
                option: options,
                onTap: () {
                  if (quesNo <= data.length) {
                    qusChange(options);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Answer(name: name),
                      ),
                    );
                  }
                },
              );
            }),
          ],
        ),

        // IconButton(
        //   onPressed: () {
        //     if (quesNo <= data.length) {
        //       qusChange();
        //     } else {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Answer(name: name)),
        //       );
        //     }
        //   },
        //   icon: Icon(
        //     Icons.arrow_forward_ios,
        //     color: Colors.white,
        //     size: 35,
        //   ),
        // ),
      ),
    );
  }
}
