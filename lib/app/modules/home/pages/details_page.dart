import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:stv/app/shared/components/my_snackbar.dart';
import 'package:stv/app/shared/constants/api_constant.dart';
import 'package:stv/app/shared/models/tv_serie_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:stv/app/shared/constants/string_contant.dart';
import 'package:stv/app/modules/home/modules/tv_series/tv_series_controller.dart';
import 'package:stv/app/modules/home/modules/tv_series_favorites/tv_series_favorites_controller.dart';

class DetailsPage extends StatefulWidget {
  final TvSerieModel model;

  const DetailsPage({Key key, @required this.model}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final seriesFavoritesController = Modular.get<TvSeriesFavoritesController>();
  final seriesController = Modular.get<TvSeriesController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              fit: BoxFit.fill,
              height: height / 2,
              width: double.infinity,
              image: '${ApiConstants.URL_IMAGE_LOGO_PATH}/w780/${widget.model.posterPath}',
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.model.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .merge(const TextStyle(color: Colors.black54)),
                        ),
                      ),
                      Observer(builder: (_) {
                        return IconButton(
                          icon: Icon(
                            seriesFavoritesController.checkFavorite(widget.model.id)
                                ? Icons.star
                                : Icons.star_border,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () => _addFavorite(widget.model),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 5,
                          rating: (widget.model.voteAverage / 2),
                          size: 20,
                          color: Theme.of(context).accentColor,
                          spacing: 4,
                        ),
                      ),
                      Text(
                        '${widget.model.voteAverage} / ${widget.model.voteCount} ${StringConstant.votos}',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    seriesController.getGenres(widget.model.genreIds),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .merge(const TextStyle(color: Colors.black45)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    StringConstant.sinopse,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .merge(const TextStyle(color: Colors.black54)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.model.overview,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .merge(const TextStyle(color: Colors.black45)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addFavorite(TvSerieModel model) {
    seriesFavoritesController.addFavariteList(widget.model).catchError((error) {
      MySnackBar.show(context, error, SnackBarTpEnum.error);
    });
  }
}
