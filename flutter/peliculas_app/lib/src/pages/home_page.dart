import 'package:flutter/material.dart';
import 'package:peliculas_app/src/providers/peliculas_provider.dart';
import 'package:peliculas_app/src/search/search_delegate.dart';
import 'package:peliculas_app/src/widgets/card_widget.dart';
import 'package:peliculas_app/src/widgets/movie_horizonta_widget.dart';

class HomePage extends StatelessWidget {
  PeliculasProvider peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Peliculas'),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // funcion propia de flutter
                showSearch(context: context,
                    delegate: DataSearch(),
                 // query: 'Hola'
                );
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _swiperTargetas(),
              _footer(context)
            ],
          ),
        ));
  }

  Widget _swiperTargetas() {
    return FutureBuilder(
        future: peliculasProvider.getCines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(peliculas: snapshot.data);
          } else {
            return Container(
                height: 400.0,
                child: Center(
                    child: CircularProgressIndicator()
                )
            );
          }
        });
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme
                .of(context)
                .textTheme
                .headline6),
          ),
          SizedBox(height: 5.0,),
          StreamBuilder(
              stream: peliculasProvider.popularesStream,
              builder: (BuildContext context, AsyncSnapshot<List>snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(peliculas: snapshot.data, siguientepagina: peliculasProvider.getPopulares);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
          )
        ],
      ),
    );
  }
}
