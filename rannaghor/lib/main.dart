import 'package:flutter/material.dart';

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
    return MaterialApp(home: Center(child: Text('hello')));
  }
}
