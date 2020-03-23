import 'package:mobx/mobx.dart';
import 'package:stv/app/shared/repositories/tv_series/tv_series_interface.dart';
import 'package:stv/app/shared/repositories/genres/genres_interface.dart';
import 'package:stv/app/shared/models/tv_serie_model.dart';
import 'package:stv/app/shared/models/genre_model.dart';
import 'package:stv/app/shared/constants/string_contant.dart';

part 'tv_series_controller.g.dart';

class TvSeriesController = _TvSeriesControllerBase with _$TvSeriesController;

abstract class _TvSeriesControllerBase with Store {
  final ITvSeriesRepository _tvSeriesRepository;
  final IGenresRepository _genreRepository;

  ObservableList<TvSerieModel> lstTvSerie = ObservableList.of([]);
  ObservableList<GenreModel> lstGenre = ObservableList.of([]);

  int currentPage = 1;
  setCurrentPage(int value) => currentPage = value;

  int maxPage;
  setMaxPage(int value) => maxPage = value;

  @observable
  String errorMessage;
  @action
  setErrorMessage(String value) => errorMessage = value;

  String get firstDayOfWeek {
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return firstDayOfWeek.toString().substring(0, 10);
  }

  String getGenres(List<int> ids) {
    var lstGenres = lstGenre.where((v) => ids.contains(v.id)).toList();
    var lstValue = lstGenres.map((v) => v.name).toList();
    return lstValue.join(', ');
  }

  _TvSeriesControllerBase(this._tvSeriesRepository, this._genreRepository) {
    _getData();
    _getGenres();
  }

  @action
  void _getData() {
    _tvSeriesRepository.getAll(page: currentPage, initDate: firstDayOfWeek).then((value) {
      setMaxPage(value.totalPages);
      lstTvSerie.addAll(value.results);
    }).catchError((error) {
      print(error);
      setErrorMessage(StringConstant.erroAoCarregarDados);
    });
  }

  @action
  void _getGenres() {
    _genreRepository.getAll().then((value) {
      lstGenre.addAll(value.genres);
    }).catchError((error) {
      print(error);
      setErrorMessage(StringConstant.erroAoCarregarDados);
    });
  }

  void nextPage() {
    if (currentPage < maxPage) {
      setCurrentPage(currentPage + 1);
      _getData();
    }
  }
}
