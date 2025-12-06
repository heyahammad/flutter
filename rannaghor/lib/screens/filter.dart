import 'package:flutter/material.dart';
// import 'package:rannaghor/screens/main_drawer.dart';
// import 'package:rannaghor/screens/tab_screen.dart';
import 'package:rannaghor/provider/filter_provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;
  @override
  State<FilterScreen> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  var glutenfree = false;
  var lactosefree = false;
  var vegetarian = false;
  var vegan = false;

  @override
  void initState() {
    super.initState();
    glutenfree = widget.currentFilter[Filter.glutenFree]!;
    lactosefree = widget.currentFilter[Filter.lactoseFree]!;
    vegetarian = widget.currentFilter[Filter.vegetarian]!;
    vegan = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onScreen: (i) {
      //     if (i == 'meals') {
      //       Navigator.of(context).pop();
      //       Navigator.of(
      //         context,
      //       ).pushReplacement(MaterialPageRoute(builder: (ctx) => TabScreen()));
      //     } else if (i == 'filters') {
      //       Navigator.of(context).pop();
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.lactoseFree: lactosefree,
            Filter.glutenFree: glutenfree,
            Filter.vegetarian: vegetarian,
            Filter.vegan: vegan,
          });

          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: lactosefree,
              onChanged: (isChecked) {
                setState(() {
                  lactosefree = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.onTertiary,
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Lactose-free meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
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
            SwitchListTile(
              value: vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  vegetarian = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.onTertiary,
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegeterian meals.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (isChecked) {
                setState(() {
                  vegan = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.onTertiary,
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
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
