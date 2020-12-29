import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences prefs;

  initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  // estas propiedades no se van a usar

/*  bool _colorSecundario;
  int _genero;
  String _nombre;*/

// crear get y set

  get genero {
    return prefs.getInt('generoapp') ?? 1;
  }

  set genero(int value){
    prefs.setInt('generoapp', value);
  }

  get colorSecundario {
    return prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value){
    prefs.setBool('colorSecundario', value);
  }

  get nombreUsuario {
    return prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value){
    prefs.setString('nombreUsuario', value);
  }

  get ultimaPagina {
    return prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value){
    prefs.setString('ultimaPagina', value);
  }

}
