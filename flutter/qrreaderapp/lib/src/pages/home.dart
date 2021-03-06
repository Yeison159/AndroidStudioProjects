import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottonNavigatorBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
          onPressed: _scanQR
      ),
    );
  }

  void _scanQR() async {
    print('aqui se supome que se escaneba');
  }

  Widget _callPage(int paginaActual) {
    switch(paginaActual){
      case 0: return MapasPage();
      case 1: return DireccionesPage();
      default:
        return MapasPage();
    }
  }
  Widget _crearBottonNavigatorBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
             currentIndex = index;
          });
        },
        items:[
          BottomNavigationBarItem(
              icon: Icon( Icons.map),
              title: Text('Mapas')
          ),
          BottomNavigationBarItem(
              icon: Icon( Icons.brightness_5),
              title: Text('Direcciones')
          )
        ]
    );
  }

}
