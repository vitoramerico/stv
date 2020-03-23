import 'package:mobx/mobx.dart';
import 'package:stv/app/shared/auth/auth_controller.dart';
import 'package:stv/app/shared/repositories/tv_series/tv_series_interface.dart';
import 'package:stv/app/shared/models/tv_serie_model.dart';
import 'package:stv/app/shared/models/favorite_model.dart';
import 'package:stv/app/shared/constants/string_contant.dart';

part 'tv_series_favorites_controller.g.dart';

class TvSeriesFavoritesController = _TvSeriesFavoritesControllerBase with _$TvSeriesFavoritesController;

abstract class _TvSeriesFavoritesControllerBase with Store {
  final AuthController _authController;
  final ITvSeriesRepository _tvSeriesRepository;

  ObservableList<TvSerieModel> lstTvSerieFavorites = ObservableList.of([]);

  int currentPage = 1;
  setCurrentPage(int value) => currentPage = value;

  int maxPage;
  setMaxPage(int value) => maxPage = value;

  @observable
  String errorMessage;
  @action
  setErrorMessage(String value) => errorMessage = value;

  bool checkFavorite(int id) => lstTvSerieFavorites.where((v) => v.id == id).isNotEmpty;

  _TvSeriesFavoritesControllerBase(this._tvSeriesRepository, this._authController) {
    _getData();
  }

  @action
  void _getData() {
    _tvSeriesRepository
        .getAllFavorites(_authController.userToken.accountId, page: currentPage)
        .then((value) {
      setMaxPage(value.totalPages);
      lstTvSerieFavorites.addAll(value.results);
    }).catchError((error) {
      setErrorMessage(StringConstant.erroAoCarregarDados);
    });
  }

  void nextPage() {
    if (currentPage < maxPage) {
      setCurrentPage(currentPage + 1);
      _getData();
    }
  }


  @action
  Future<Null> addFavariteList(TvSerieModel model) async {
    try {
      bool isCheck = checkFavorite(model.id);

      var favorite = FavoriteModel(mediaType: 'tv', mediaId: model.id, favorite: !isCheck);

      await _tvSeriesRepository.addFavorite(_authController.userToken.sessionId, favorite);

      if (isCheck)
        lstTvSerieFavorites.removeWhere((v) => v.id == model.id);
      else
        lstTvSerieFavorites.add(model);
    } catch (error) {
      setErrorMessage(StringConstant.erroAoModificarItem);
    }
  }
}
