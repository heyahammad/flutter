import "package:flutter/material.dart";
import "package:khorchapati/expenses.dart";

void main() {
  return runApp(Khorchapati());
}

class Khorchapati extends StatelessWidget {
  const Khorchapati({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Container(child: Expenses())),
    );
  }
}
