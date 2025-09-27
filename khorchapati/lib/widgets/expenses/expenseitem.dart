import 'package:flutter/material.dart';
import 'package:khorchapati/model/expense.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    Icon icon;
    if (expense.category == Category.work) {
      icon = Icon(Icons.work);
    } else if (expense.category == Category.food) {
      icon = Icon(Icons.fastfood);
    } else if (expense.category == Category.leisure) {
      icon = Icon(Icons.movie);
    } else if (expense.category == Category.travel) {
      icon = Icon(Icons.flight);
    } else {
      icon = Icon(Icons.question_mark);
    }
    return Card(
      color: Colors.amberAccent,
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
                Icon(icon.icon),
                const SizedBox(width: 5),
                Text(expense.date.toString().split('.')[0]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
