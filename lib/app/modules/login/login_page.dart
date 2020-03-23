import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mobx/mobx.dart';
import 'package:stv/app/shared/constants/api_constant.dart';
import 'package:stv/app/shared/components/my_snackbar.dart';
import 'package:stv/app/shared/constants/string_contant.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = StringConstant.login}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains(ApiConstants.URL_AUTHORIZED)) _login();
    });

    disposer = autorun((_) {
      if (controller.urlAuthorizeToken != null)
        flutterWebviewPlugin.reloadUrl(controller.urlAuthorizeToken);
    });
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebviewPlugin.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: controller.urlAuthorizeToken ?? '',
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text(StringConstant.carregando),
        ),
      ),
    );
  }

  void _login() {
    controller.login().then((value) {
      Modular.to.pushReplacementNamed('\home');
    }).catchError((error) {
      MySnackBar.show(context, error.toString(), SnackBarTpEnum.error);
    });
  }
}
