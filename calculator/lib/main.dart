import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Numpad());
}

class Numpad extends StatefulWidget {
  const Numpad({super.key});
  State<Numpad> createState() => _Numpad();
}

class _Numpad extends State<Numpad> {
  String out = '2';
  void output(String label) {
    setState(() {
      if (label == "C") {
        // Clear everything
        out = "0";
      } else if (label == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(out);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          // check if result is int or float
          if (eval == eval.toInt()) {
            out = eval.toInt().toString(); // show as int
          } else {
            out = eval.toString(); // show as float
          }
        } catch (e) {
          out = "Error";
        }
      } else {
        // Append input
        if (out == "0") {
          out = label; // replace 0 with first input
        } else {
          out += label;
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 90, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(150, 255, 255, 255),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(20),
                          child: Text(
                            out,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GridView.count(
                      crossAxisCount: 4, // 4 buttons per row
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      children: [
                        button("7"),
                        button("8"),
                        button("9"),
                        button("/"),
                        button("4"),
                        button("5"),
                        button("6"),
                        button("*"),
                        button("1"),
                        button("2"),
                        button("3"),
                        button("-"),
                        button("C"),
                        button("0"),
                        button("="),
                        button("+"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button(String label) {
    // Determine background color based on label
    Color bgColor;
    if (label.toLowerCase() == 'c') {
      bgColor = const Color.fromARGB(150, 255, 82, 82);
    } else if ('=/*+-'.contains(label)) {
      bgColor = const Color.fromARGB(150, 64, 195, 255);
    } else {
      bgColor = const Color.fromARGB(150, 255, 255, 255);
    }

    return FilledButton(
      onPressed: () => output(label),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}
