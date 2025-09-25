import 'package:flutter/material.dart';
import 'package:khorchapati/listexpenses.dart';
import 'package:khorchapati/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredList = [
    Expense(
      title: 'food',
      date: DateTime.now(),
      amount: 2500,
      category: Category.food,
    ),
    Expense(
      title: 'Dekhlam',
      date: DateTime.now(),
      amount: 1000,
      category: Category.leisure,
    ),
    Expense(
      title: 'Ghurlam',
      date: DateTime.now(),
      amount: 1500,
      category: Category.travel,
    ),
    Expense(
      title: 'Korlam',
      date: DateTime.now(),
      amount: 3500,
      category: Category.work,
    ),
    Expense(
      title: 'Khailam',
      date: DateTime.now(),
      amount: 500,
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('ei dekh'),
        Expanded(child: ListExpenses(expenses: _registeredList)),
      ],
    );
  }
}
