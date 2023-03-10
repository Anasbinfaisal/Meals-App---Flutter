import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';
import 'package:meals_app/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  // const MealItem({Key? key}) : super(key: key);

  final String? title, imageUrl, id;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;

  MealItem(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability});

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl!,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ), //image
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ), //title
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${duration} min'),
                  ]),
                  Row(children: [
                    Icon(
                      Icons.work,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${complexity?.name} '),
                  ]),
                  Row(children: [
                    Icon(
                      Icons.attach_money,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${affordability?.name} '),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
