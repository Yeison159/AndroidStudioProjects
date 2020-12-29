import 'package:flutter/material.dart';
import 'package:preferencias_usuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuarioapp/src/widgets/menu_widgest.dart';


class HomePage extends StatelessWidget {
  static final String routName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario)? Colors.teal: Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      )
    );
  }
}
