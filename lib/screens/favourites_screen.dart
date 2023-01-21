import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/meal_item.dart';
import '../models/Meal.dart';
import '../models/favorites.dart';

class FavouritesScreen extends StatefulWidget {
  // FavouritesScreen(this.favMeals);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var favMealItem = Provider.of<Favorites>(context);

    if (favMealItem.favMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var meal = favMealItem.favMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );

          // var meal = favMealItem.favMeals[index];
          //
          // return
        },
        itemCount: favMealItem.favMeals.length,
      );
    }
  }
}
