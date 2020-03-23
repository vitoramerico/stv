import 'package:dio/native_imp.dart';
import 'package:stv/app/shared/constants/api_constant.dart';
import 'package:stv/app/shared/models/genres_model.dart';

import 'genres_interface.dart';

class GenresRepository implements IGenresRepository {
  final DioForNative client;

  GenresRepository(this.client);

  @override
  Future<GenresModel> getAll({String language: 'pt-BR'}) async {
    var queryParameters = {
      'api_key': ApiConstants.READ_TOKEN,
      'language': language,
    };

    var response = await client.get(
      '/3/genre/movie/list',
      queryParameters: queryParameters,
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('status_code') && result['status_code'] != 1)
      throw ArgumentError(response.data['status_message']);
    else
      return GenresModel.fromMap(response.data);
  }
}