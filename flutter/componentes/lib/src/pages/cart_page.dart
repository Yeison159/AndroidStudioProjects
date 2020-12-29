import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card'),),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1()
        ],
      ),
    );
  }
 Widget _cardTipo1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue, ),
            title: Text('Soy el titulo de la targeta'),
            subtitle: Text(' soy el subtitulo de la targeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Cancelar",
                ),
              ),
              FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Ok",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
