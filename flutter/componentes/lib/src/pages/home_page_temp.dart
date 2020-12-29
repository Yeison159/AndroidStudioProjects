import 'package:flutter/material.dart';

class HomeTem extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('componentes app'),
      ),
      body: ListView(children: _agregarItemsCorto()),
    );
  }

  List<Widget> _agregar() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)..add(Divider());
    }

    return lista;
  }

  List<Widget> _agregarItemsCorto() {
    return opciones.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e),
            subtitle: Text('cualquier cosa'),
            leading: Icon(Icons.access_alarms) ,
            trailing: Icon(Icons.arrow_right),
            onTap: (){},
          )
        ],
      );
    }).toList();
  }
}
