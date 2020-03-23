import 'package:flutter_modular/flutter_modular.dart';

import 'tv_series_favorites_page.dart';

class TvSeriesFavoritesModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TvSeriesFavoritesPage()),
      ];

  static Inject get to => Inject<TvSeriesFavoritesModule>.of();
}
