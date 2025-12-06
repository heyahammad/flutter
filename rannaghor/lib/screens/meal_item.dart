import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:rannaghor/screens/meal_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    // required this.toogleFavouriteMeal,
  });
  // final Function(Meal meal) toogleFavouriteMeal;
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealScreen(
              meal: meal,
              // toogleFavouriteMeal: toogleFavouriteMeal,
            ),
          ),
        ),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
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
                              '${meal.duration} Minute',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              meal.complexity.name,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              meal.affordability.name,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
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
    );
  }
}
