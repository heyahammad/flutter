import 'package:flutter/material.dart';
import 'package:quiz/quizPage.dart';

String? ans;
String? ans2;
String? ans3;
String? ans4;
String? ans5;

class Question extends StatefulWidget {
  final String ques;
  final List<String> options;
  final String? groupValue;
  final int? qno;
  final int? nqno;
  final String ans;

  const Question({
    super.key,
    required this.ques,
    required this.options,
    required this.groupValue,
    required this.qno,
    required this.nqno,
    required this.ans,
  });

  @override
  State<Question> createState() => _Question();
}

class _Question extends State<Question> {
  String? selected;

  @override
  void initState() {
    if (widget.qno == 1) selected = ans;
    if (widget.qno == 2) selected = ans2;
    if (widget.qno == 3) selected = ans3;
    if (widget.qno == 4) selected = ans4;
    if (widget.qno == 5) selected = ans5;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: gra),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                widget.ques,
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
            SizedBox(height: 20),
            for (final option in widget.options)
              Row(
                children: [
                  SizedBox(width: 30),
                  Radio<String>(
                    side: BorderSide(color: Colors.white),
                    activeColor: const Color.fromARGB(255, 255, 255, 255),
                    groupValue: selected,
                    value: option,
                    onChanged: (v) {
                      setState(() {
                        selected = v;
                        if (widget.qno == 1) ans = v;
                        if (widget.qno == 2) ans2 = v;
                        if (widget.qno == 3) ans3 = v;
                        if (widget.qno == 4) ans4 = v;
                        if (widget.qno == 5) ans5 = v;
                      });
                    },
                  ),

                  Text(
                    option,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            IconButton(
              onPressed: () {
                if (widget.nqno == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ques2()),
                  );
                } else if (widget.nqno == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ques3()),
                  );
                } else if (widget.nqno == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ques4()),
                  );
                } else if (widget.nqno == 5) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ques5()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Answer()),
                  );
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ques1 extends StatelessWidget {
  const Ques1({super.key});

  @override
  Widget build(BuildContext context) {
    return Question(
      ques: "What is Dart?",
      options: [
        "Programming Language",
        "Symbol Language",
        "Hyper Texting Language",
        "Bangla Language",
      ],
      groupValue: ans,
      qno: 1,
      nqno: 2,
      ans: 'Programming Language',
    );
  }
}

class Ques2 extends StatelessWidget {
  const Ques2({super.key});

  @override
  Widget build(BuildContext context) {
    return Question(
      ques: "Who developed Flutter?",
      options: ["Microsoft", "Apple", "Google", "Meta"],
      groupValue: ans2,
      qno: 2,
      nqno: 3,
      ans: 'Google',
    );
  }
}

class Ques3 extends StatelessWidget {
  const Ques3({super.key});

  @override
  Widget build(BuildContext context) {
    return Question(
      ques: "Which widget is used for layouts in Flutter?",
      options: ["Container", "Column", "Row", "All of the above"],
      groupValue: ans3,
      qno: 3,
      nqno: 4,
      ans: 'All of the above',
    );
  }
}

class Ques4 extends StatelessWidget {
  const Ques4({super.key});

  @override
  Widget build(BuildContext context) {
    return Question(
      ques: "Which language is used to write Flutter apps?",
      options: ["C++", "Java", "Dart", "Python"],
      groupValue: ans4,
      qno: 4,
      nqno: 5,
      ans: 'dart',
    );
  }
}

class Ques5 extends StatelessWidget {
  const Ques5({super.key});

  @override
  Widget build(BuildContext context) {
    return Question(
      ques: "Which company created the Dart language?",
      options: ["Microsoft", "Google", "Oracle", "IBM"],
      groupValue: ans5,
      qno: 5,
      nqno: null,
      ans: 'Google',
    );
  }
}

class Answer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int score = 0;
    if (ans == 'Programming Language') {
      score++;
    }
    if (ans2 == 'Google') {
      score++;
    }
    if (ans3 == 'All of the above') {
      score++;
    }
    if (ans4 == 'Dart') {
      score++;
    }
    if (ans5 == 'Google') {
      score++;
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
