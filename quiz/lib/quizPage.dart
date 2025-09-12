import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
                child: Text(
                  'whats your name?',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(onPressed: () {}, child: Text('')),
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
