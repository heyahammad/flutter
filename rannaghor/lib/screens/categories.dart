import 'package:flutter/material.dart';
import 'package:rannaghor/data/dummy_data.dart';
import 'package:rannaghor/models/category.dart';
import 'package:rannaghor/screens/meals.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:rannaghor/widgets/categories_grid.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.toogleFavouriteMeal,
    required this.mealFromFilter,
  });

  final Function(Meal meal) toogleFavouriteMeal;
  final List<Meal> mealFromFilter;

  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = mealFromFilter
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          toogleFavouriteMeal: toogleFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Categories')),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoriesGrid(
              category: category,
              nav: () => selectCategory(context, category),
            ),
        ],
      ),
    );
  }
}
