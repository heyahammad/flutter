import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khorchapati/model/expense.dart';

class Addexpense extends StatefulWidget {
  const Addexpense({super.key, required this.onAddExpense});

  final void Function(Expense expense)? onAddExpense;

  @override
  State<Addexpense> createState() => _Addexpense();
}

class _Addexpense extends State<Addexpense> {
  String? title;
  DateTime? date;
  double? amount;
  Category? category = Category.food;

  void _date() {
    DateTime firstDate = DateTime.now().subtract(Duration(days: 365));
    DateTime lastDate = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((value) {
      setState(() {
        date = value;
      });
    });
  }

  void submitexpense() {
    if (title != null && amount != null && date != null && category != null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog.adaptive(
            title: Text('Success', style: GoogleFonts.poppins()),
            content: Text(
              'Expense added successfully',
              style: GoogleFonts.poppins(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.pop(context);
                },

                child: Text(
                  'OK',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
      widget.onAddExpense!(
        Expense(
          title: title!,
          amount: amount!,
          date: date!,
          category: category!,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog.adaptive(
            title: Text('Invalid Input', style: GoogleFonts.poppins()),
            content: Text(
              'Please fill all the fields',
              style: GoogleFonts.poppins(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text(
                  'OK',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,

      child: Column(
        children: [
          SizedBox(height: 40),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              decoration: InputDecoration(label: Text('Title')),
              cursorColor: Colors.black,
              onChanged: (val) {
                title = val;
              },
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Amount'),
                      prefixText: '৳ ',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      amount = double.tryParse(val);
                    },
                  ),
                ),
                Spacer(),
                Text(
                  'Select Date',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () => _date(),
                  icon: Icon(Icons.calendar_month),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: 300,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton(
                    value: category,
                    underline: SizedBox(),

                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),

                    dropdownColor: Colors.amberAccent,
                    items: [...Category.values]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (ctx) {
                      setState(() {
                        category = ctx;
                      });
                    },
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 251, 231, 158),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.amberAccent, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  onPressed: submitexpense,
                  icon: Icon(Icons.done, color: Colors.black),
                  label: Text(
                    'Add',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadowColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
