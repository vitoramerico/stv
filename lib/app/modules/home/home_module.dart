import 'package:flutter_modular/flutter_modular.dart';
import 'package:stv/app/shared/auth/auth_controller.dart';
import 'package:stv/app/shared/services/custom_dio.dart';
import 'package:stv/app/shared/repositories/tv_series/tv_series_interface.dart';
import 'package:stv/app/shared/repositories/tv_series/tv_series_repository.dart';
import 'package:stv/app/shared/repositories/genres/genres_interface.dart';
import 'package:stv/app/shared/repositories/genres/genres_repository.dart';

import 'home_controller.dart';
import 'modules/tv_series/tv_series_controller.dart';
import 'modules/tv_series_favorites/tv_series_favorites_controller.dart';
import 'pages/details_page.dart';
import 'pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ITvSeriesRepository>((i) => TvSeriesRepository(Modular.get<CustomDio>())),
        Bind<IGenresRepository>((i) => GenresRepository(Modular.get<CustomDio>())),
        Bind((i) => HomeController()),
        Bind((i) => TvSeriesController(i.get<TvSeriesRepository>(), i.get<GenresRepository>())),
        Bind((i) => TvSeriesFavoritesController(i.get<TvSeriesRepository>(), Modular.get<AuthController>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/details', child: (_, args) => DetailsPage(model: args.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
