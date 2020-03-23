import 'package:mobx/mobx.dart';
import 'package:stv/app/shared/auth/auth_controller.dart';
import 'package:stv/app/shared/constants/api_constant.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController _authController;

  @observable
  String urlAuthorizeToken;
  @action
  setUrlAuthorizeToken(String value) => urlAuthorizeToken = value;

  _LoginControllerBase(this._authController) {
    _init();
  }

  Future<Null> _init() async {
    await _authController.getRequestToken();

    setUrlAuthorizeToken('${ApiConstants.URL_AUTHORIZE_TOKEN}${_authController.requestToken}');
  }

  Future<Null> login() async {
    await _authController.login();
  }
}
