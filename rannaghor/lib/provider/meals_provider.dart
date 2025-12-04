import 'package:riverpod/riverpod.dart';
import 'package:rannaghor/data/dummy_data.dart';

final meals = Provider((ref) {
  return dummyMeals;
});
