import 'package:flutter/material.dart';
import 'package:khorchapati/model/expense.dart';
import 'package:khorchapati/widgets/expenses/expenseitem.dart';

class ListExpenses extends StatelessWidget {
  const ListExpenses({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red,
          ),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: Colors.white, size: 40),
        ),
        direction: DismissDirection.endToStart,
        key: ValueKey(expenses[index]),
        child: Expenseitem(expenses[index]),
      ),
    );
  }
}
