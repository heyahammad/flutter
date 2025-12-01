import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black54,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    clipBehavior: Clip.hardEdge,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(meal.imageUrl),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    color: Theme.of(context).canvasColor.withOpacity(0.4),
                    elevation: 0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Ingredients',
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          for (final ing in meal.ingredients)
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onBackground,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  ing,
                                  style: GoogleFonts.poppins(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onBackground,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Theme.of(context).canvasColor.withOpacity(0.4),
                    elevation: 0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Steps',
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          for (int i = 0; i < meal.steps.length; i++)
                            Text(
                              '${i + 1}. ${meal.steps[i]}',
                              style: GoogleFonts.poppins(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onBackground,
                                fontSize: 16,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
