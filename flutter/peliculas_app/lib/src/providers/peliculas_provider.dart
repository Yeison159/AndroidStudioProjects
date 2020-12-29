
import 'dart:async';
import 'dart:convert';
import 'package:peliculas_app/src/models/actores_model.dart';
import 'package:peliculas_app/src/models/peliculas_model.dart';
import "package:http/http.dart" as http;

class PeliculasProvider {
  String _apiKey = 'b1cbfce5515fe9dc2a96b8a711a1c6fe';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();
  // esto es para manejar el estado global de la aplicaicon en este caso de peliculas
  // el broadCast es para que se pueda escuchar desde varios componentes
  final _popularesStreamCtrl = StreamController<List<Pelicula>>.broadcast();

  // se crean dos getters una para escuchar que informacion ingresa y otro para optener la informacion que sale

  Function(List<Pelicula>) get popularesSink => _popularesStreamCtrl.sink.add;

  Stream<List<Pelicula>>get popularesStream => _popularesStreamCtrl.stream;


  void disposeStream(){
    _popularesStreamCtrl?.close();
  }

  Future<List<Pelicula>> getCines() async{
     final url = Uri.https(_url, '3/movie/now_playing', {
       'api_key': _apiKey,
       'language': _languaje
     });

     final resp = await http.get(url);

     final decodedData = json.decode(resp.body);

     final peliculas = new Peliculas.fromJsonList(decodedData['results']);

     return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async{

    if(_cargando) return [];
    _cargando= true;

    _popularesPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _languaje,
      'page': _popularesPage.toString()
    });


    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final populares = new Peliculas.fromJsonList(decodedData['results']);
    final respon = populares.items;
    _populares.addAll(respon);
    popularesSink(_populares);
    _cargando = false;
     return respon;
  }

 Future<List<Actor>> getCast(String peliId) async{
   final url = Uri.https(_url, '3/movie/$peliId/credits', {
     'api_key': _apiKey,
     'language': _languaje
   });

   final resp = await http.get(url);
   final decodedData = json.decode(resp.body);
   final actores = new Cast.fromJsonList(decodedData['cast']);
   return actores.items;
  }


  Future<List<Pelicula>> buscarpelicula(String query) async{
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _languaje,
      'query': query
    });

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }
}