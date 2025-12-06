import 'package:riverpod/legacy.dart';

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
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
  (ref) => FilterProvider(),
);
