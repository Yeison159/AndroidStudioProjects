import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/pages/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRReader',
       initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,

      ),
    );
  }
}
