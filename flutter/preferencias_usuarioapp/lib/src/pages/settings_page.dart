import 'package:flutter/material.dart';
import 'package:preferencias_usuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuarioapp/src/widgets/menu_widgest.dart';


class Settingspage extends StatefulWidget {
  static final String routName = 'settings';

  @override
  _SettingspageState createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  bool _colorSecundario = true;
  int _genero = 1;
  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.ultimaPagina = Settingspage.routName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  void _setSelectedRadio(int value)  {
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario)? Colors.teal: Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Setting',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                    prefs.colorSecundario = value;
                  });
                }),
            RadioListTile(
                value: 1,
                title: Text('masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio
            ),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de la persona'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
