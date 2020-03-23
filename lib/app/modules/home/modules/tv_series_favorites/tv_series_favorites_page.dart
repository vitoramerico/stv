import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stv/app/shared/components/itens_tv_series_widget.dart';
import 'package:stv/app/shared/components/my_snackbar.dart';
import 'package:stv/app/shared/constants/string_contant.dart';
import 'package:mobx/mobx.dart';

import 'tv_series_favorites_controller.dart';

class TvSeriesFavoritesPage extends StatefulWidget {
  final String title;
  
  const TvSeriesFavoritesPage({Key key, this.title = StringConstant.seriesFavoritas})
      : super(key: key);

  @override
  _TvSeriesFavoritesPageState createState() => _TvSeriesFavoritesPageState();
}

class _TvSeriesFavoritesPageState extends ModularState<TvSeriesFavoritesPage, TvSeriesFavoritesController> {
  final _scrollController = ScrollController();

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
        controller.nextPage();
    });

    disposer = autorun((_) {
      if (controller.errorMessage != null)
        MySnackBar.show(context, controller.errorMessage, SnackBarTpEnum.error);
    });
  }

  @override
  void dispose() {
    disposer();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              int lstSize = controller.lstTvSerieFavorites.length;

              if (index < lstSize) {
                return ItensTvSeriesWidget(
                  model: controller.lstTvSerieFavorites[index],
                  onPressed: (v) => Modular.to.pushNamed('home/details', arguments: v),
                );
              }

              if (controller.currentPage == controller.maxPage || controller.maxPage == 0)
                return Container();

              return Center(child: CircularProgressIndicator());
            },
            itemCount: controller.lstTvSerieFavorites.length + 1,
          );
        },
      ),
    );
  }
}
