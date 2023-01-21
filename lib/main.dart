import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/models/filters.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_Screen.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import 'dummy_data.dart';
import 'models/Meal.dart';
import 'models/favorites.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Favorites()),
        ChangeNotifierProvider.value(value: Filters()),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.yellow,
          canvasColor: Color.fromRGBO(31, 161, 182, 1.0),
          fontFamily: 'Raleway',
          // textTheme: ThemeData.light().textTheme.copyWith(
          //       bodyText1: TextStyle(
          //         color: Color.fromRGBO(20, 51, 51, 1),
          //       ),
          //       bodyText2: TextStyle(
          //         color: Color.fromRGBO(20, 51, 51, 1),
          //       ),
          //       titleLarge:
          //           TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
          //       titleMedium:
          //           TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
          //       titleSmall:
          //           TextStyle(fontSize: 21, fontFamily: 'RobotoCondensed'),
          //     ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => tabsScreen(), // favMeals),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
          CategoriesScreen.routeName: (context) => CategoriesScreen(),
          MealDetail.routeName: (context) =>
              MealDetail(), //_toggleFavorites, _isMealFav),
          // Filters_Screen.routeName: (context) => Filters_Screen(),
        },
        // home: CategoriesScreen(),
      ),
    );
  }
}
