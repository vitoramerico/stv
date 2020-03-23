import 'package:mobx/mobx.dart';
import 'package:stv/app/shared/models/user_token_model.dart';
import 'package:stv/app/shared/repositories/auth/auth_interface.dart';
import 'package:stv/app/shared/repositories/local_storage/local_storage.dart';
import 'package:stv/app/shared/repositories/local_storage/local_storage_interface.dart';

part 'auth_controller.g.dart';

enum AuthStatus { loading, login, logoff }

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository;
  final ILocalStorage _localStorage;

  @observable
  UserTokenModel userToken;
  @action
  setUserToken(UserTokenModel value) {
    userToken = value;
    status = userToken == null ? AuthStatus.logoff : AuthStatus.login;
  }

  @observable
  String requestToken;
  @action
  setRequestToken(String value) => requestToken = value;

  @observable
  AuthStatus status = AuthStatus.loading;

  _AuthControllerBase(this._authRepository, this._localStorage) {
    _localStorage
        .get<UserTokenModel>(LocalStorage.USER_TOKEN, construct: (v) => UserTokenModel.fromMap(v))
        .then((value) => setUserToken(value));
  }

  Future<Null> getRequestToken() async {
    setRequestToken(await _authRepository.getRequestToken());
  }

  Future<Null> login() async {
    var user = await _authRepository.getAccessToken(requestToken);
    user.sessionId = await _authRepository.getSessionId(user.accessToken);

    await _localStorage.put(LocalStorage.USER_TOKEN, user.toMap());

    setUserToken(user);
  }
}