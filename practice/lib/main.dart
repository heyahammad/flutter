import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/titlef.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MatchMaker()));
}

class MatchMaker extends StatefulWidget {
  const MatchMaker({super.key});

  @override
  _MatchMakerState createState() => _MatchMakerState();
}

class _MatchMakerState extends State<MatchMaker> {
  final TextEditingController boyController = TextEditingController();
  final TextEditingController girlController = TextEditingController();
  String result = "";

  void calculateMatch() {
    String boy = boyController.text.trim();
    String girl = girlController.text.trim();

    if (boy.isEmpty || girl.isEmpty) {
      setState(() {
        result = "⚠ Please enter both names!";
      });
      return;
    }

    if (boy == 'faisal' || boy == 'Faisal') {
      setState(() {
        result = "💖 $boy is Legend. 100% Matched💖";
      });
    } else {
      int percentage = Random().nextInt(101); // 0 - 100 %

      setState(() {
        result = "$boy ❤️ $girl = $percentage% Match!";
      });
    }
  }

  InputDecoration themedInput(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        color: Colors.white.withOpacity(0.9),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      floatingLabelStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 255, 0, 140).withOpacity(0.85),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.7),
          width: 1.8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.white, width: 2.5),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      // subtle drop shadow to make it pop
      constraints: const BoxConstraints(maxHeight: 70),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 194, 232),
      appBar: AppBar(
        title: Titlef(),
        backgroundColor: const Color.fromARGB(255, 255, 0, 140),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: boyController,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                decoration: themedInput("Enter a boy name:"),
              ),
              SizedBox(height: 16),
              TextField(
                controller: girlController,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                decoration: themedInput("Enter a girl name:"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateMatch,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 0, 140),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                  "Check Match 💕",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                result,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
