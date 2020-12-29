import 'package:flutter/material.dart';
import 'package:peliculas_app/src/models/peliculas_model.dart';
import 'package:peliculas_app/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion;
  
  final PeliculasProvider peliculasProvider = new PeliculasProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro appBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // se limpia la propiedad o los datos ingresados en el buscador
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icono que aparece a la izquierda
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // se devuelve a la pagina am¿nterior
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados q vamos a mostrar
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarpelicula(query),
      builder: (context, AsyncSnapshot<List<Pelicula>> snapshot){
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
           return ListView.builder(
                itemCount: peliculas.length,
               itemBuilder:  (context, i) {
                return ListTile(
                  onTap: (){
                    close(context, null);
                    peliculas[i].uniqueId = '';
                    Navigator.pushNamed(context, 'detalle', arguments: peliculas[i]);
                  },
                  leading: FadeInImage(
                    placeholder: AssetImage('assets/img/loading.gif') ,
                    image: NetworkImage(peliculas[i].getPosterImg()),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(peliculas[i].title),
                  subtitle: Text(peliculas[i].originalTitle),
                );
               }
           );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // ejemplo
   /* final listaBusqueda = (query.isEmpty)
        ? peliculasRecientes
        : peliculasRecientes.where((p) =>
        p.toLowerCase().startsWith(query.toLowerCase())).toList();
    // Son las sugerencias que aparecen cuando la persona escribe
    return ListView.builder(
        itemCount: listaBusqueda.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaBusqueda[i]),
            onTap: (){
              seleccion = listaBusqueda[i];
              showResults(context);
            },
          );
        }
    );*/
  }
}
