import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          textColor: Colors.white,
          color: Colors.blue,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(context: context,
    // barrierDismissible para que se pueda cerrrar desde afuer
    barrierDismissible: true,
    builder: (context){
      return AlertDialog(
        title: Text('Este es el titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('contenido de la alerta'),
            FlutterLogo(size: 100.0,),
          ],
        ),
        actions: [
          FlatButton(
            child: Text('cancelar'),
            onPressed: (){
               Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    });
  }
}
