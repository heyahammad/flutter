import 'package:flutter/material.dart';
import 'package:khorchapati/model/expense.dart';

class ListExpenses extends StatelessWidget {
  const ListExpenses({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Text(expenses[index].title),
    );
  }
}
