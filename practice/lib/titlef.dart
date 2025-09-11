import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Titlef extends StatelessWidget {
  const Titlef({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Text(
        'BIYASHADI.COM',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 30,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w700,
          ),
        ),
      )),
    );
  }
}
