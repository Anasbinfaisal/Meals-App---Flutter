import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';
import 'Meal.dart';

class Favorites with ChangeNotifier {
  List<Meal> _favMeals = [];

  bool isMealFav(String id) {
    return _favMeals.any((element) => element.id == id);
  }

  List<Meal> get favMeals {
    return [..._favMeals];
  }

  void addFav(String mealID) {
    _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
    notifyListeners();
  }

  void removeFav(int existingIndex) {
    _favMeals.removeAt(existingIndex);
    notifyListeners();
  }
}
