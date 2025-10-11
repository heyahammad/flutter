import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khorchapati/widgets/chart/chart.dart';
import 'package:khorchapati/widgets/expenses/addexpense.dart';
import 'package:khorchapati/widgets/expenses/listexpenses.dart';
import 'package:khorchapati/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredList = [];

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
        title: Row(
          children: [
            Icon(Icons.table_rows_outlined, size: 30),
            SizedBox(width: 2),
            Text(
              'KHORCHAPATI',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => _openAddOverlay(),
            icon: Icon(Icons.add, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Chart(expenses: _registeredList),
          SizedBox(height: 8),
          Expanded(child: content),
        ],
      ),
    );
  }
}
