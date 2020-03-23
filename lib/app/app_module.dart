import 'package:stv/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:stv/app/app_widget.dart';
import 'package:stv/app/modules/home/home_module.dart';
import 'package:stv/app/modules/login/login_module.dart';

import 'shared/auth/auth_controller.dart';
import 'shared/repositories/auth/auth_repository.dart';
import 'shared/repositories/auth/auth_interface.dart';
import 'shared/repositories/local_storage/local_storage.dart';
import 'shared/repositories/local_storage/local_storage_interface.dart';
import 'shared/services/custom_dio.dart';
import 'splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ILocalStorage>((i) => LocalStorage()),
        Bind((i) => CustomDio(i.get<LocalStorage>())),
        Bind<IAuthRepository>((i) => AuthRepository(i.get<CustomDio>())),
        Bind((i) => AppController()),
        Bind((i) => AuthController(i.get<AuthRepository>(), i.get<LocalStorage>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
