import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Landingpage extends StatelessWidget {
  const Landingpage(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6DD5FA),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz App',
                style: GoogleFonts.bebasNeue(
                  textStyle: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.question_answer,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 36,
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(gradient: gra),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  width: 260,
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'LETS START',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(180, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: IconButton(
                  onPressed: () {
                    startQuiz();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 60,
                    color: Color.fromARGB(180, 255, 255, 255),
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
