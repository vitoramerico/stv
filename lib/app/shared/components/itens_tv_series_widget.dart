import 'package:flutter/material.dart';
import 'package:stv/app/shared/constants/api_constant.dart';
import 'package:stv/app/shared/models/tv_serie_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ItensTvSeriesWidget extends StatelessWidget {
  final TvSerieModel model;

  final Function(TvSerieModel) onPressed;

  const ItensTvSeriesWidget({
    Key key,
    @required this.model,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: '${ApiConstants.URL_IMAGE_LOGO_PATH}/w154/${model.posterPath}',
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            model.firstAirDate.substring(0, 4),
                            style: const TextStyle(color: Colors.black38),
                          ),
                        ),
                        Text(
                          model.voteAverage.toString(),
                          style: const TextStyle(color: Colors.black38),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      model.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .merge(const TextStyle(color: Colors.black54)),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        model.overview,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(color: Colors.black45),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        onTap: () => onPressed(model),
      ),
    );
  }
}
