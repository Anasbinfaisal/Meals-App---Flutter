import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'Meal.dart';

class Filters with ChangeNotifier {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  Map<String, bool> get filters {
    return _filters;
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> get availableMeals {
    return [..._availableMeals];
  }

  void set_filters(Map<String, bool> filterData) {
    _filters = filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree!) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree!) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan!) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian!) {
        return false;
      }
      return true;
    }).toList();

    notifyListeners();
  }
}
