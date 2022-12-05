
import 'package:meta/meta.dart';
import 'dart:convert';

import 'menu.dart';

Restaurants restaurantsFromJson(String str) => Restaurants.fromJson(json.decode(str));

String restaurantsToJson(Restaurants data) => json.encode(data.toJson());

class Restaurants {
  Restaurants({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  Restaurants copyWith({
    required List<Restaurant> restaurants,
  }) =>
      Restaurants(
        restaurants: restaurants ?? this.restaurants,
      );

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant copyWith({
    required  id,
    required String name,
    required description,
    required String pictureId,
   required String city,
    required double rating,
    required Menus menus,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        city: city ?? this.city,
        rating: rating ?? this.rating,
        menus: menus ?? this.menus,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
    menus: Menus.fromJson(json["menus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
    "menus": menus.toJson(),
  };

}

List<Restaurants> parseRestaurant(String? json){
  if(json == null){
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurants.fromJson(json)).toList();
}

