import 'package:flutter/material.dart';
import 'package:khorchapati/model/expense.dart';
import 'package:khorchapati/widgets/expenses/expenseitem.dart';

class ListExpenses extends StatelessWidget {
  const ListExpenses({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Expenseitem(expenses[index]),
    );
  }
}
