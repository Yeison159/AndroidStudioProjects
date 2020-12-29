import 'package:flutter/material.dart';
import 'package:peliculas_app/src/models/peliculas_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientepagina;

   MovieHorizontal({Key key, @required this.peliculas,@required this.siguientepagina}) : super(key: key);

  final _pageController = new PageController(
      initialPage: 1,
      viewportFraction: 0.3
  );


  @override
  Widget build(BuildContext context) {

    final _screemSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
        if (_pageController.position.pixels >= _pageController.position.maxScrollExtent-200) {
          siguientepagina();
        }
    });

    return Container(
       height: _screemSize.height * 0.2,
       child: PageView.builder(
         itemCount: peliculas.length,
         pageSnapping: false,
         controller: _pageController,
         itemBuilder: (context, i){
           return _targeta(context, peliculas[i]);
         },
       ),
    );
  }

  Widget _targeta(BuildContext context, Pelicula pelicula){
// este id se manda para que se diferencia de los ids del los widges de principales
    pelicula.uniqueId = '${pelicula.id}-poster';
    final targeta =Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif') ,
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 110.0,
              ),
            ),
          ),
          Text(pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,)
        ],
      ),
    );

    return GestureDetector(
      onTap: ()=> {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula)
      },
      child: targeta,
    );
  }

/* List<Widget> _targetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/loading.gif') ,
                image: NetworkImage(pelicula.getPosterImg()),
                fit: BoxFit.cover,
                height: 110.0,
              ),
            ),
            Text(pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,)
          ],
        ),
      );
    }).toList();
 }*/
}
