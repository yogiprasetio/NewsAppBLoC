
class Drink {
  Drink({
    required this.name,
  });

  final String name;

  Drink copyWith({
    required String name,
  }) =>
      Drink(
        name: name ?? this.name,
      );

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}