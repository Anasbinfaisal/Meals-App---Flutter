import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/favorites.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:provider/provider.dart';

import '../components/main_drawer.dart';
import '../models/Meal.dart';

class tabsScreen extends StatefulWidget {
  // final List<Meal>? favMeals;
  //
  // tabsScreen({this.favMeals});

  // const tabsScreen({Key? key}) : super(key: key);

  @override
  State<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  late final List<Widget> _pages;

  @override
  void initState() {
    _pages = [CategoriesScreen(), FavouritesScreen()];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      //   // bottom: TabBar(
      //   //   tabs: [
      //   //     Tab(
      //   //       icon: Icon(Icons.category),
      //   //       text: 'Categories',
      //   //     ),
      //   //     Tab(
      //   //       icon: Icon(Icons.star),
      //   //       text: 'Favourites',
      //   //     ),
      //   //   ],
      //   // ),
      // ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
      // TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavouritesScreen(),
      //   ],
      // ),
    );
  }
}
