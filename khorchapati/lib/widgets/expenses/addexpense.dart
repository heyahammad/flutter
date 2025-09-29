import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khorchapati/model/expense.dart';

class Addexpense extends StatefulWidget {
  const Addexpense({super.key});

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 400,

      child: Column(
        children: [
          SizedBox(height: 40),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                label: Text('Title'),
                labelStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              cursorColor: Colors.black,
              onChanged: (val) {
                title = val;
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
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
                      labelStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      amount = val as double;
                    },
                  ),
                ),
                Spacer(),
                Text(
                  'Select Date',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () => _date(),
                  icon: Icon(Icons.calendar_month),
                  color: Colors.black,
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
                  onPressed: () {},
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
                  onPressed: () {},
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
