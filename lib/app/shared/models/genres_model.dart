import 'dart:convert';

import 'genre_model.dart';

class GenresModel {
  List<GenreModel> genres;

  GenresModel({
    this.genres,
  });

  factory GenresModel.fromJson(String str) => GenresModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenresModel.fromMap(Map<String, dynamic> json) => GenresModel(
        genres: List<GenreModel>.from(json["genres"].map((x) => GenreModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
      };
}
