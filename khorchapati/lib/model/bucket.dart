import 'package:khorchapati/model/expense.dart';

class ExpenseBucket {
  ExpenseBucket({required this.expense, required this.category});

  ExpenseBucket.forCategory(List<Expense> allexpense, this.category)
    : expense = allexpense
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expense;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expense) {
      sum += expense.amount;
    }

    return sum;
  }
}
