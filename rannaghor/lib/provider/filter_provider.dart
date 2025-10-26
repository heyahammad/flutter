import 'package:riverpod/legacy.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rannaghor/provider/meals_provider.dart';

enum Filter { lactoseFree, glutenFree, vegetarian, vegan }

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
      });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> choosen) {
    state = choosen;
  }
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
  (ref) => FilterProvider(),
);

final filteredMealsProvider = Provider((ref) {
  final listMeal = ref.watch(meals);
  final availablefilter = ref.watch(filterProvider);
  return listMeal.where((meal) {
    if (!meal.isGlutenFree && availablefilter[Filter.glutenFree]!) {
      return false;
    }
    if (!meal.isLactoseFree && availablefilter[Filter.lactoseFree]!) {
      return false;
    }
    if (!meal.isVegan && availablefilter[Filter.vegan]!) {
      return false;
    }
    if (!meal.isVegetarian && availablefilter[Filter.vegetarian]!) {
      return false;
    }
    return true;
  }).toList();
});
