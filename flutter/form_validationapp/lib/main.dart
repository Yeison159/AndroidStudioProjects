import 'package:flutter/material.dart';
import 'package:form_validationapp/src/bloc/provider.dart';
import 'package:form_validationapp/src/pages/home_page.dart';
import 'package:form_validationapp/src/pages/login_page.dart';
import 'package:form_validationapp/src/pages/producto_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'producto' : (BuildContext context) => ProdutoPage(),
        },
      ),
    );



  }
}
