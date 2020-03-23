import 'dart:convert';

class GenreModel {
  int id;
  String name;

  GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(String str) => GenreModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenreModel.fromMap(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
