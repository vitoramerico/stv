import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stv/app/modules/home/modules/tv_series/tv_series_module.dart';
import 'package:stv/app/modules/home/modules/tv_series_favorites/tv_series_favorites_module.dart';
import 'package:stv/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _pageController = PageController();

  int get indexPage => _pageController?.page?.round() ?? 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            return Text(['Series', 'Series Favoritas'][indexPage]);
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          RouterOutlet(module: TvSeriesModule()),
          RouterOutlet(module: TvSeriesFavoritesModule()),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            return BottomNavigationBar(
              currentIndex: indexPage,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Series')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star_border), title: Text('Series Favoritas')),
              ],
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
            );
          }),
    );
  }
}
