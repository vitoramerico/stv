import 'dart:convert';
import 'tv_serie_model.dart';

class TvSeriesModel {
    int page;
    int totalResults;
    int totalPages;
    List<TvSerieModel> results;

    TvSeriesModel({
        this.page,
        this.totalResults,
        this.totalPages,
        this.results,
    });

    factory TvSeriesModel.fromJson(String str) => TvSeriesModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TvSeriesModel.fromMap(Map<String, dynamic> json) => TvSeriesModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<TvSerieModel>.from(json["results"].map((x) => TvSerieModel.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "total_results": totalResults,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}