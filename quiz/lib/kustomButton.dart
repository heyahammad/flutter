import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KustomButton extends StatelessWidget {
  const KustomButton({super.key, required this.option, required this.onTap});
  final String option;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF6DD5FA),
        overlayColor: Color.fromARGB(255, 61, 76, 82),
        side: BorderSide(color: Colors.white, style: BorderStyle.solid),
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Text(
        option,
        style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
