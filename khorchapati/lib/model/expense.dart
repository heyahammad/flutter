import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icon(Icons.fastfood),
  Category.travel: Icon(Icons.flight),
  Category.leisure: Icon(Icons.movie),
  Category.work: Icon(Icons.work),
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uuid.v4();

  final double amount;
  final String title;
  final String id;
  final DateTime date;
  final Category category;

  get fomatteddata {
    return formatter.format(date);
  }
}
