import 'package:dio/dio.dart';
import 'package:stv/app/shared/models/user_token_model.dart';
import 'package:stv/app/shared/repositories/local_storage/local_storage.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _storage;

  AuthInterceptor(this._storage);

  @override
  onRequest(RequestOptions options) async {
    var userTokenModel = await _storage.get<UserTokenModel>(LocalStorage.USER_TOKEN,
        construct: (v) => UserTokenModel.fromMap(v));

    if (!options.headers.containsKey("Authorization") && userTokenModel != null) {
      options.headers["Authorization"] = "Bearer ${userTokenModel.accessToken}";
    }

    return options;
  }

  @override
  onResponse(Response response) async {
    return response;
  }

  @override
  onError(DioError e) async {
    return e;
  }
}
