import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rannaghor/screens/tab_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 226, 131, 68),
  ),

  textTheme: GoogleFonts.poppinsTextTheme(),
);

void main() {
  runApp(const Rannaghor());
}

class Rannaghor extends StatefulWidget {
  const Rannaghor({super.key});
  @override
  State<Rannaghor> createState() => _Rannaghor();
}

class _Rannaghor extends State<Rannaghor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, title: 'RannaGhor', home: TabScreen());
  }
}
