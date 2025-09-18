import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/data.dart';
import 'answer.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(((data['index'] as int) + 1).toString()),
            Column(
              children: [
                Text(
                  (data['question']).toString(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
                ),
                SizedBox(height: 5),
                Text(
                  (data['correct-answer']).toString(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 7),
                ),
                SizedBox(height: 5),
                Text(
                  (data['choosen-answer']).toString(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 7),
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
