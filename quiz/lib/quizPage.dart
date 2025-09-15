import 'dart:ui';

import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    String name;
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
                child: Text(
                  'whats your name?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Switch(
                value: false,
                onChanged: (bool? h) {
                  print(h);
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 40,
                  width: 320,
                  child: TextField(
                    cursorColor: const Color.fromARGB(180, 255, 255, 255),
                    cursorHeight: 20,
                    obscureText: true,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(180, 255, 255, 255),
                          width: 2.0,
                        ),
                      ),

                      prefixIcon: Icon(
                        Icons.verified_user,
                        color: const Color.fromARGB(180, 255, 255, 255),
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
                        Icons.people,
                        color: Color.fromARGB(180, 255, 255, 255),
                        size: 40,
                      ),
                    ),
                    onChanged: (String val) {
                      name = val;
                    },
                  ),
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
