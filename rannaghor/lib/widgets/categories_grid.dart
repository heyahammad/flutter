import 'package:flutter/material.dart';
import 'package:rannaghor/models/category.dart';

class CategoriesGrid extends StatelessWidget {
  final Category category;
  final void Function() nav;
  const CategoriesGrid({super.key, required this.category, required this.nav});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => nav(),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
