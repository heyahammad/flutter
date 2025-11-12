import 'package:flutter/material.dart';
import 'package:rannaghor/data/dummy_data.dart';
import 'package:rannaghor/widgets/categories_grid.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in avaiableCategories) CategoriesGrid(category),
        ],
      ),
    );
  }
}
