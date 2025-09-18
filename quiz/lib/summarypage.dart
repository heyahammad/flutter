import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:color_hex/color_hex.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            var icon;
            if (data['icon'] == 'wrong') {
              icon = Icon(
                Symbols.close,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              );
            } else {
              icon = Icon(
                Symbols.check,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              );
            }
            return Column(
              children: [
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: data['bgcolor'].toString().convertToColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          ((data['index'] as int) + 1).toString(),
                          style: GoogleFonts.poppins(
                            backgroundColor: data['bgcolor']
                                .toString()
                                .convertToColor,
                            color: data['txtcolor'].toString().convertToColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data['question']).toString(),

                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: '#F3F2EC'.convertToColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  (data['correct-answer']).toString(),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Symbols.check,
                                  size: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: data['options-color']
                                  .toString()
                                  .convertToColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  (data['choosen-answer']).toString(),
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    color: data['txtcolor']
                                        .toString()
                                        .convertToColor,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 5),
                                icon,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
