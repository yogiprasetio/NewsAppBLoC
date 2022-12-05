part of 'models.dart';

class Source {
  Source({
    this.id,
    this.name,
  });

  final dynamic? id;
  final String? name;

  Source copyWith({
    required dynamic id,
    required String name,
  }) =>
      Source(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? "Not Identified" : json["id"],
        name: json["name"] == null ? "Not Identified" : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
