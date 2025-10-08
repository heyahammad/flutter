import "package:flutter/material.dart";
import "package:khorchapati/widgets/expenses.dart";

void main() {
  return runApp(Khorchapati());
}

class Khorchapati extends StatelessWidget {
  const Khorchapati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        cardTheme: CardThemeData(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      home: Expenses(),
    );
  }
}
