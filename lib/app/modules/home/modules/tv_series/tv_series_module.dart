import 'package:flutter_modular/flutter_modular.dart';

import 'tv_series_page.dart';

class TvSeriesModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TvSeriesPage()),
      ];

  static Inject get to => Inject<TvSeriesModule>.of();
}
