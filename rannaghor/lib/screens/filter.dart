import 'package:flutter/material.dart';
import 'package:rannaghor/screens/main_drawer.dart';
import 'package:rannaghor/screens/tab_screen.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  @override
  State<FilterScreen> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  var glutenfree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      drawer: MainDrawer(
        onScreen: (i) {
          if (i == 'meals') {
            Navigator.of(context).pop();
            Navigator.of(
              context,
            ).pushReplacement(MaterialPageRoute(builder: (ctx) => TabScreen()));
          } else if (i == 'filters') {
            Navigator.of(context).pop();
          }
        },
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({Filter.glutenFree: glutenfree});
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenfree,
              onChanged: (isChecked) {
                setState(() {
                  glutenfree = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.onTertiary,
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
