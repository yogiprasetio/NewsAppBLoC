
import 'drink.dart';

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Drink> foods;
  final List<Drink> drinks;

  Menus copyWith({
    required List<Drink> foods,
    required List<Drink> drinks,
  }) =>
      Menus(
        foods: foods ?? this.foods,
        drinks: drinks ?? this.drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}
