import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

enum SnackBarTpEnum {
  sucess,
  info,
  error,
}

const Map<SnackBarTpEnum, MaterialColor> SnackBarTpEnumColor = {
  SnackBarTpEnum.sucess: Colors.green,
  SnackBarTpEnum.info: Colors.amber,
  SnackBarTpEnum.error: Colors.red,
};

const Map<SnackBarTpEnum, IconData> SnackBarTpEnumIcon = {
  SnackBarTpEnum.sucess: Icons.check,
  SnackBarTpEnum.info: Icons.info_outline,
  SnackBarTpEnum.error: Icons.close,
};

class MySnackBar {
  static void show(BuildContext context, String msg, SnackBarTpEnum type, {int seconds}) {
    Flushbar(
      message: msg,
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      icon: Icon(
        SnackBarTpEnumIcon[type],
        size: 28.0,
        color: SnackBarTpEnumColor[type],
      ),
      duration: Duration(seconds: seconds ?? 3),
      leftBarIndicatorColor: SnackBarTpEnumColor[type],
    )..show(context);
  }
}
