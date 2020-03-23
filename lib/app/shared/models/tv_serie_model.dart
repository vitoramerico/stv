import 'dart:convert';

class TvSerieModel {
    int id;
    String name;
    double popularity;
    int voteCount;
    double voteAverage;
    String firstAirDate;
    String posterPath;
    List<int> genreIds;
    String backdropPath;
    String overview;

    TvSerieModel({
        this.id,
        this.name,
        this.popularity,
        this.voteCount,
        this.voteAverage,
        this.firstAirDate,
        this.posterPath,
        this.genreIds,
        this.backdropPath,
        this.overview,
    });

    factory TvSerieModel.fromJson(String str) => TvSerieModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TvSerieModel.fromMap(Map<String, dynamic> json) => TvSerieModel(
        id: json["id"],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        voteAverage: json["vote_average"].toDouble(),
        firstAirDate: json["first_air_date"],
        posterPath: json["poster_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "popularity": popularity,
        "vote_count": voteCount,
        "vote_average": voteAverage,
        "first_air_date": firstAirDate,
        "poster_path": posterPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "backdrop_path": backdropPath,
        "overview": overview,
    };
}
