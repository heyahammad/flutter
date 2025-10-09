import 'package:flutter/material.dart';
import 'package:khorchapati/model/expense.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 15),
            Row(
              children: [
                Text('BDT ${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Icon(categoryIcons[expense.category]?.icon),
                const SizedBox(width: 5),
                Text(expense.fomatteddata),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
