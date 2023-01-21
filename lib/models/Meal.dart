enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String? id, title, imageUrl;
  final List<String>? categories, ingredients, steps;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final bool? isGlutenFree, isVegan, isVegetarian, isLactoseFree;

  const Meal(
      {this.id,
      this.title,
      this.imageUrl,
      this.categories,
      this.ingredients,
      this.steps,
      this.duration,
      this.complexity,
      this.affordability,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree});
}
