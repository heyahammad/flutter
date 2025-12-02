import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onScreen});
  final Function(String identifier) onScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).cardColor.withOpacity(0.1),
                ],
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48),
                SizedBox(width: 18),
                Text(
                  'Rannaghor',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              onScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              onScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
