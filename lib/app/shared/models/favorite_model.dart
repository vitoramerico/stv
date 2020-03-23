import 'dart:convert';

class FavoriteModel {
    String mediaType;
    int mediaId;
    bool favorite;

    FavoriteModel({
        this.mediaType,
        this.mediaId,
        this.favorite,
    });

    factory FavoriteModel.fromJson(String str) => FavoriteModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FavoriteModel.fromMap(Map<String, dynamic> json) => FavoriteModel(
        mediaType: json["media_type"],
        mediaId: json["media_id"],
        favorite: json["favorite"],
    );

    Map<String, dynamic> toMap() => {
        "media_type": mediaType,
        "media_id": mediaId,
        "favorite": favorite,
    };
}