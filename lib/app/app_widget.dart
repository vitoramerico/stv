import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stv/app/shared/constants/string_contant.dart';

class AppWidget extends StatelessWidget {

  final ThemeData kDefaultThemeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueGrey[700],
    accentColor: Colors.teal,
    buttonColor: Colors.teal,
    hintColor: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: StringConstant.appTitle,
      theme: kDefaultThemeLight,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
