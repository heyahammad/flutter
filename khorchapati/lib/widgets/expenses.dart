import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khorchapati/widgets/expenses/addexpense.dart';
import 'package:khorchapati/widgets/expenses/listexpenses.dart';
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

  void _addEx(Expense expense) {
    setState(() {
      _registeredList.add(expense);
    });
  }

  void _removeEX(Expense expense) {
    int index = _registeredList.indexOf(expense);
    setState(() {
      _registeredList.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Expense Deleted',
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.amberAccent,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.black,
          onPressed: () {
            setState(() {
              _registeredList.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddOverlay() {
    setState(() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Addexpense(onAddExpense: _addEx);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredList.isNotEmpty) {
      content = ListExpenses(
        expenses: _registeredList,
        onRemoveExpense: _removeEX,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khorchapati', textAlign: TextAlign.left),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () => _openAddOverlay(), icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Expense Till Now'),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}
