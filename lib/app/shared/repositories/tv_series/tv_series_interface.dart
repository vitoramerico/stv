import 'package:stv/app/shared/models/tv_series_model.dart';
import 'package:stv/app/shared/models/favorite_model.dart';

abstract class ITvSeriesRepository {
  Future<TvSeriesModel> getAll({int page, String language, String sortBy, String initDate});
  Future<TvSeriesModel> getAllFavorites(String accountId, {int page, String language});
  Future<Null> addFavorite(String sessionId, FavoriteModel model);
}
