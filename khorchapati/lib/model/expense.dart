import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Category { food, travel, leisure, work, other }

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
}
