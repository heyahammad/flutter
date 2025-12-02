import 'package:flutter/material.dart';
import 'package:rannaghor/screens/categories.dart';
import 'package:rannaghor/screens/main_drawer.dart';
import 'package:rannaghor/screens/meals.dart';
import 'package:rannaghor/models/meal.dart';
import 'package:rannaghor/screens/filter.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int screenIndex = 0;

  List<Meal> favouriteMeals = [];

  void showMessage(String msg) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 3),
        action: SnackBarAction(label: 'Okay', onPressed: () {}),
      ),
    );
  }

  void _toogleFavouriteMeal(Meal meal) {
    final isExisting = favouriteMeals.contains(meal);

    if (isExisting) {
      showMessage('Remove from favourites!');
      setState(() {
        favouriteMeals.remove(meal);
      });
    } else {
      showMessage('Added to favourites!');
      setState(() {
        favouriteMeals.add(meal);
      });
    }
  }

  void _screenChange(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FilterScreen()),
      );

      print(result);
    }
  }

  void selectScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Categories(toogleFavouriteMeal: _toogleFavouriteMeal);

    if (screenIndex == 1) {
      activeScreen = MealsScreen(
        title: 'Your Favorites',
        meals: favouriteMeals,
        toogleFavouriteMeal: _toogleFavouriteMeal,
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            );
          },
        ),
      ),
      body: activeScreen,
      drawer: MainDrawer(onScreen: _screenChange),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: screenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
