import 'package:flutter/material.dart';
import 'package:diceroller/diceroller.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: DiceRoller()),
    ),
  );
}
