import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validationapp/src/models/producto_model.dart';
import 'package:form_validationapp/src/provider/productos_provider.dart';
import 'package:form_validationapp/src/utils/utils.dart' as utils;

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey= GlobalKey<ScaffoldState>();
  bool _guardando = false;

  ProductoModel producto = new ProductoModel();
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      producto = prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Container(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  _crearNombre(context),
                  _crearPrecio(context),
                  _crearDisponible(context),
                  _crearBoton(context)
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre(BuildContext context) {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (value) => producto.titulo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto.';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio(BuildContext context) {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'solo numeros';
        }
      },
    );
  }

  Widget _crearDisponible(BuildContext context) {
    return SwitchListTile(
        value: producto.disponible,
        title: Text('Disponible'),
        activeColor: Colors.deepPurple,
        onChanged: (value) {
          setState(() {
            producto.disponible = value;
          });
        });
  }

  Widget _crearBoton(BuildContext context) {
    return RaisedButton.icon(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        textColor: Colors.white,
        color: Colors.deepPurple,
        onPressed: (_guardando)? null: _submit,
        icon: Icon(Icons.save),
        label: Text('Guardar'));
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;
    //dispara el evento save
    formKey.currentState.save();
    setState(() {
      _guardando = true;
    });
    if (producto.id == null) {
    productosProvider.crearProducto(producto);
    } else {
      productosProvider.editarProducto(producto);
    }

    setState(() {
      _guardando = false;
    });

    mostrarSnackBar('registo guardado');

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
