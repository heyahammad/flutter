import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:rannaghor/provider/favourite_provider.dart';

class MealScreen extends ConsumerStatefulWidget {
  const MealScreen({
    super.key,
    required this.meal,
    // required this.toogleFavouriteMeal,
  });
  final Meal meal;

  // final Function(Meal meal) toogleFavouriteMeal;
  @override
  ConsumerState<MealScreen> createState() => _MealScreen();
}

class _MealScreen extends ConsumerState<MealScreen>
    with TickerProviderStateMixin {
  late AnimationController acontroller;
  @override
  void initState() {
    super.initState();
    acontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
      lowerBound: 0,
      upperBound: 1,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      acontroller.forward();
    });
  }

  @override
  void dispose() {
    acontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favMeals = ref.watch(favouriteMeal);
    final isThere = favMeals.contains(widget.meal);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Details'),
        actions: [
          IconButton(
            onPressed: () {
              // toogleFavouriteMeal(meal);
              final act = ref
                  .read(favouriteMeal.notifier)
                  .toggleFavouriteMeals(widget.meal);
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              scaffoldMessenger.clearSnackBars();
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: Text(
                    act ? 'Added to Favourite' : 'Removed from Favourite',
                  ),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            icon: Icon(isThere ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            // tag: widget.meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(widget.meal.imageUrl),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black54,
            ),
          ),
          FadeTransition(
            opacity: acontroller.drive(
              Tween(
                begin: 0.0,
                end: 1.0,
              ).chain(CurveTween(curve: Curves.easeOut)),
            ),
            child: SingleChildScrollView(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(widget.meal.imageUrl),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.schedule, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                '${widget.meal.duration} Minute',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.work, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                widget.meal.complexity.name,
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.attach_money, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                widget.meal.affordability.name,
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
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
                                'Ingredients',
                                style: GoogleFonts.poppins(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onBackground,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              for (final ing in widget.meal.ingredients)
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
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onBackground,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              for (final s in widget.meal.steps)
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.arrow_right,
                                      size: 20,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onBackground,
                                    ),
                                    SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        s,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onBackground,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
