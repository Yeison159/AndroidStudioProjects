import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/cart_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_dart.dart';


Map<String , WidgetBuilder> getPlicationRoutes(){

  return <String, WidgetBuilder>{
    '/' : (BuildContext context) => HomePage(),
    'alert' : (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'AnimatedContainer': (BuildContext context)=> AnimatedContainerPage(),
    'inputs' : (BuildContext context)=> InputPage(),
    'list'  :   (BuildContext context)=> ListaPage()
  };
}
