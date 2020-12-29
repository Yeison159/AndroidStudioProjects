import 'package:flutter/material.dart';
import 'package:preferencias_usuarioapp/src/pages/home_page.dart';
import 'package:preferencias_usuarioapp/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue,),
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue,),
            title: Text('People'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue,),
            title: Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(context, Settingspage.routName),
          )
        ],
      ),
    );
  }
}
