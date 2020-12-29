import 'package:flutter/material.dart';
import 'package:form_validationapp/src/models/producto_model.dart';
import 'package:form_validationapp/src/provider/productos_provider.dart';

/*class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(context),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado(BuildContext context) {
    return FutureBuilder(
        future: productosProvider.cargarProductos(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductoModel>> snapshot) {
          if (snapshot.hasData) {
            final productos = snapshot.data;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItem(context, productos[i]),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      onDismissed: (dir){
        productosProvider.borrarProducto(producto.id);
      },
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: ()=> Navigator.pushNamed(context, 'producto', arguments: producto),
      ),
    );
  }
}*/



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productosProvider = new ProductosProvider();
  final scaffoldKey= GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(context),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearBoton(BuildContext context) {

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado(BuildContext context) {
    return FutureBuilder(
        future: productosProvider.cargarProductos(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ProductoModel>> snapshot) {
          if (snapshot.hasData) {
            final productos = snapshot.data;
            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, i) => _crearItem(context, productos[i]),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      onDismissed: (dir){
        setState(() {
          productosProvider.borrarProducto(producto.id);
          productosProvider.cargarProductos();
        });

        mostrarSnackBar('Registro eliminado');
      },
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      child: ListTile(
        title: Text('${producto.titulo} - ${producto.valor}'),
        subtitle: Text(producto.id),
        onTap: ()=> Navigator.pushNamed(context, 'producto', arguments: producto),
      ),
    );
  }

  void mostrarSnackBar(String mensaje){
    final snackbar = SnackBar(
        duration: Duration(milliseconds: 1500),
        content: Text(mensaje)
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
    // Navigator.pop(context);
  }
}
