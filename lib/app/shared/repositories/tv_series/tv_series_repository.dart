import 'package:dio/native_imp.dart';
import 'package:stv/app/shared/constants/api_constant.dart';
import 'package:stv/app/shared/models/tv_series_model.dart';
import 'package:stv/app/shared/models/favorite_model.dart';

import 'tv_series_interface.dart';

class TvSeriesRepository implements ITvSeriesRepository {
  final DioForNative client;

  TvSeriesRepository(this.client);

  @override
  Future<TvSeriesModel> getAll({
    int page: 1,
    String language: 'pt-BR',
    String sortBy: 'popularity.desc',
    String initDate: '',
  }) async {
    var queryParameters = {
      'page': page,
      'language': language,
      'sort_by': sortBy,
      'air_date.gte': initDate,
    };

    var response = await client.get(
      '/4/discover/tv',
      queryParameters: queryParameters,
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('status_code') && result['status_code'] != 1)
      throw ArgumentError(response.data['status_message']);
    else
      return TvSeriesModel.fromMap(response.data);
  }

  @override
  Future<TvSeriesModel> getAllFavorites(
    String accountId, {
    int page: 1,
    String language: 'pt-BR',
  }) async {
    var queryParameters = {
      'page': page,
      'language': language,
    };

    var response = await client.get(
      '/4/account/$accountId/tv/favorites',
      queryParameters: queryParameters,
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('status_code') && result['status_code'] != 1)
      throw ArgumentError(response.data['status_message']);
    else
      return TvSeriesModel.fromMap(response.data);
  }

  @override
  Future<Null> addFavorite(String sessionId, FavoriteModel model) async {
    var queryParameters = {
      'api_key': ApiConstants.API_KEY,
      'session_id': sessionId,
    };

    var response = await client.post(
      '/3/account/{account_id}/favorite',
      queryParameters: queryParameters,
      data: model.toJson(),
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('status_code') && result['status_code'] != 1 && result['status_code'] != 12 && result['status_code'] != 13)
      throw ArgumentError(response.data['status_message']);
  }
}
