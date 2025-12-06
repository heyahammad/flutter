import 'package:flutter/material.dart';
import 'package:rannaghor/data/dummy_data.dart';
import 'package:rannaghor/models/category.dart';
import 'package:rannaghor/screens/meals.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:rannaghor/widgets/categories_grid.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    // required this.toogleFavouriteMeal,
    required this.mealFromFilter,
  });
  // final Function(Meal meal) toogleFavouriteMeal;
  final List<Meal> mealFromFilter;
  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController animationCotroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationCotroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    animationCotroller.forward();
  }

  @override
  void dispose() {
    animationCotroller.dispose();
    super.dispose();
  }

  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.mealFromFilter
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          // toogleFavouriteMeal: toogleFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationCotroller,
      child: GridView(
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
      builder: (context, child) => SlideTransition(
        position: animationCotroller.drive(
          Tween<Offset>(begin: Offset(0, 0.2), end: Offset(0, 0)),
        ),
        child: FadeTransition(
          opacity: animationCotroller.drive(
            Tween<double>(begin: 0.0, end: 1.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
