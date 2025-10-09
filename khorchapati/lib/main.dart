import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:khorchapati/widgets/expenses.dart";

void main() {
  return runApp(Khorchapati());
}

var kolorScheme = ColorScheme.fromSeed(seedColor: Colors.amberAccent);

class Khorchapati extends StatelessWidget {
  const Khorchapati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.amberAccent,
        ),
        iconTheme: IconThemeData(color: Colors.amberAccent),
        cardTheme: CardThemeData(
          color: const Color.fromARGB(255, 54, 54, 54),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(95, 54, 54, 54),
          foregroundColor: Colors.amberAccent,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.amberAccent,
        ),

        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.amberAccent,
          labelStyle: GoogleFonts.poppins(
            color: Colors.amberAccent,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.amberAccent, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.amberAccent, width: 2),
          ),
        ),
      ),

      theme: ThemeData().copyWith(
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.amberAccent,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
        cardTheme: CardThemeData(
          color: Colors.amberAccent,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
          labelStyle: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 0, 0, 0),
              width: 2,
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: Expenses(),
    );
  }
}
