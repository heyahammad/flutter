import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:rannaghor/screens/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No meals available!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
          itemCount: meals.length,
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Theme.of(context).canvasColor.withOpacity(0.5),
            ),
          ),
        ),
        title: Text(title),
      ),
      body: content,
    );
  }
}
