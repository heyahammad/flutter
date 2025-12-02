import 'package:flutter/material.dart';
import 'package:rannaghor/screens/categories.dart';
import 'package:rannaghor/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int screenIndex = 0;

  void selectScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = Categories();

    if (screenIndex == 1) {
      activeScreen = MealsScreen(title: 'Your Favorites', meals: []);
    }

    return Scaffold(
      // appBar: AppBar(title: Text('.....')),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: screenIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
        ],
      ),
    );
  }
}
