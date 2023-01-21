import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/favorites.dart';
import 'package:provider/provider.dart';

class MealDetail extends StatefulWidget {
  static const routeName = "/meal_detail";

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  void _toggleFavorites(String mealID, BuildContext ctx) {
    var fav_meal = Provider.of<Favorites>(ctx, listen: false);

    final existingIndex =
        fav_meal.favMeals.indexWhere((meal) => meal.id == mealID);

    if (existingIndex >= 0) {
      setState(() {
        fav_meal.removeFav(existingIndex);
      });
    } else {
      setState(() {
        fav_meal.addFav(mealID);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var fav_meal = Provider.of<Favorites>(context, listen: false);

    final mealId =
        ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId['id']);

    Widget buildSectionTitle(String text) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white60,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: child,
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(fav_meal.isMealFav(mealId['id']!)
              ? Icons.star
              : Icons.star_border),
          onPressed: () {
            _toggleFavorites(mealId['id']!, context);
          },
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(selectedMeal.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients'),
              buildContainer(ListView.builder(
                itemCount: selectedMeal.ingredients!.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Text(selectedMeal.ingredients![index]),
                  ),
                ),
              )),
              buildSectionTitle('Steps'),
              buildContainer(ListView.builder(
                itemCount: selectedMeal.steps!.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps![index]),
                    ),
                    Divider(),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
