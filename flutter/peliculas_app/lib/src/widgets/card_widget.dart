import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas_app/src/models/peliculas_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  const CardSwiper({Key key, @required this.peliculas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    return  Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screensize.width * 0.7,
        itemHeight: _screensize.height * 0.6,
        itemBuilder: (BuildContext context, int index) {
          // este id se manda para que se diferencia de los ids del los widges de populares
          peliculas[index].uniqueId = '${peliculas[index].id}-targetas';
          return Hero(
            tag: peliculas[index].uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]),
                child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  fit: BoxFit.cover,
                ),
              )
            ),
          );
        },
        itemCount: peliculas.length,
        // pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
