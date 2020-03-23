import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:stv/app/shared/constants/api_constant.dart';
import 'package:stv/app/shared/models/user_token_model.dart';

import 'auth_interface.dart';

class AuthRepository implements IAuthRepository {
  final DioForNative client;

  AuthRepository(this.client);

  @override
  Future<String> getRequestToken() async {
    var queryParameters = {'api_key': ApiConstants.READ_TOKEN};
    var header = {'Authorization': 'Bearer ${ApiConstants.READ_TOKEN}'};

    var response = await client.post(
      '/4/auth/request_token',
      queryParameters: queryParameters,
      options: Options(headers: header),
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('success'))
      return response.data['request_token'];
    else
      throw ArgumentError(response.data['status_message']);
  }

  @override
  Future<UserTokenModel> getAccessToken(String requestToken) async {
    var header = {'Authorization': 'Bearer ${ApiConstants.READ_TOKEN}'};

    Map<String, String> data = {'request_token': requestToken};

    var response = await client.post(
      '/4/auth/access_token',
      options: Options(headers: header),
      data: data,
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('success'))
      return UserTokenModel.fromMap(response.data);
    else
      throw ArgumentError(response.data['status_message']);
  }

  @override
  Future<String> getSessionId(String acessToken) async {
    var header = {'Authorization': 'Bearer ${ApiConstants.READ_TOKEN}'};

    Map<String, String> data = {'access_token': acessToken};

    var response = await client.post(
      '/3/authentication/session/convert/4',
      options: Options(headers: header),
      data: data,
    );

    Map<String, dynamic> result = response.data;

    if (result.containsKey('success'))
      return response.data['session_id'];
    else
      throw ArgumentError(response.data['status_message']);
  }
}
