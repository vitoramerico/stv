import 'package:stv/app/shared/models/genres_model.dart';

abstract class IGenresRepository {
  Future<GenresModel> getAll({String language});
}
