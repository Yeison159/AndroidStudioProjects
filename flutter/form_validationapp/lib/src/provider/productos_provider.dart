import 'dart:convert';

import 'package:form_validationapp/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {
  final String _url = 'https://flutter-varios-f1535.firebaseio.com';


 Future<bool> crearProducto (ProductoModel producto) async{
    final url = '$_url/productos.json';

    final resp = await http.post(url,body: productoModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<bool> editarProducto (ProductoModel producto) async{
    final url = '$_url/productos/${producto.id}.json';

    final resp = await http.put(url,body: productoModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async{
    final url = '$_url/productos.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();
    if (decodeData == null)  return null;
print(decodeData);
    decodeData.forEach((id, prod) {
      print(prod);
      print(id);
     final prodTemp = ProductoModel.fromJson(prod);
     prodTemp.id = id;
     productos.add(prodTemp);
    });

    return productos;
  }

  Future<int> borrarProducto(String id) async{
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(url);
    print(resp);
    return 1;
  }
}
