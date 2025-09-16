import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz/ques.dart';

String? name = 'default user';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String institute = '';
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gra),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 50,
                  width: 320,
                  child: TextField(
                    cursorColor: const Color.fromARGB(180, 255, 255, 255),
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(180, 255, 255, 255),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(180, 255, 255, 255),
                          width: 2.0,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(180, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: 'Name:',
                      icon: Icon(
                        Icons.person,
                        color: Color.fromARGB(180, 255, 255, 255),
                        size: 40,
                      ),
                    ),
                    style: TextStyle(color: Color.fromARGB(180, 255, 255, 255)),
                    onChanged: (String val) {
                      name = val;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 50,
                  width: 320,
                  child: TextField(
                    cursorColor: const Color.fromARGB(180, 255, 255, 255),
                    cursorHeight: 20,
                    style: TextStyle(color: Color.fromARGB(180, 255, 255, 255)),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(180, 255, 255, 255),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(180, 255, 255, 255),
                          width: 2.0,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(180, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      labelText: 'Institute:',
                      icon: Icon(
                        Icons.school,
                        color: Color.fromARGB(180, 255, 255, 255),
                        size: 40,
                      ),
                    ),
                    onChanged: (String val) {
                      institute = val;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ques1()),
                  );
                },
                icon: Icon(
                  Icons.arrow_circle_right,
                  size: 60,
                  weight: 20,
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Gradient gra = LinearGradient(
  colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
