import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Expense {
  Expense({required this.amount, required this.date, required this.title})
    : id = uuid.v4();

  final double amount;
  final String title;
  final String id;
  final DateTime date;
}
