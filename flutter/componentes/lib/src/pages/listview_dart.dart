import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numeros = new List();
  int _ultimoItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista componentes'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _numeros.length,
      itemBuilder: (BuildContext context, int index) {
        final imagen = _numeros[index];
        return FadeInImage(
            placeholder: AssetImage('asset/loading.gif'),
            image:
            NetworkImage('https://picsum.photos/500/300?random=$imagen'));
      },
    );
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _numeros.add(_ultimoItem);
    }
  }
}
