import 'package:stv/app/shared/models/user_token_model.dart';

abstract class IAuthRepository {
  Future<String> getRequestToken();
  Future<UserTokenModel> getAccessToken(String requestToken);
  Future<String> getSessionId(String acessToken);
}