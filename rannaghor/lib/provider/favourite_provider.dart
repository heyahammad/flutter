import 'package:flutter_riverpod/legacy.dart';
import 'package:rannaghor/models/meal.dart';

class FavouriteProvider extends StateNotifier<List<Meal>> {
  FavouriteProvider() : super([]);

  bool toggleFavouriteMeals(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMeal = StateNotifierProvider<FavouriteProvider, List<Meal>>((
  ref,
) {
  return FavouriteProvider();
});
