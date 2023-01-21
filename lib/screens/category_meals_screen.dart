import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:provider/provider.dart';

import '../models/Meal.dart';
import '../models/filters.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category_meals_screen";
  late List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String?, String?>;

    final categoryTitle = routeArgs['title'];
    final categoryID = routeArgs['id'];

    availableMeals = (Provider.of<Filters>(context)).availableMeals;

    final categoryMeals = availableMeals.where((meal) {
      return meal.categories!.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var meal = categoryMeals[index];

            return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
