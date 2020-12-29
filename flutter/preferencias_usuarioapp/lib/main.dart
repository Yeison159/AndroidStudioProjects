import 'package:flutter/material.dart';
import 'package:preferencias_usuarioapp/src/pages/home_page.dart';
import 'package:preferencias_usuarioapp/src/pages/settings_page.dart';
import 'package:preferencias_usuarioapp/src/share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routName: (BuildContext context) => HomePage(),
        Settingspage.routName: (BuildContext context) => Settingspage(),
      },
    );
  }
}
