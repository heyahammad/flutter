import 'package:khorchapati/model/expense.dart';

class Expensebucket {
  Expensebucket({required this.expense, required this.category});

  final Category category;
  final List<Expense> expense;

  double get dataBar {
    double sum = 0;

    for (final expense in expense) {
      sum += expense.amount;
    }

    return sum;
  }
}
