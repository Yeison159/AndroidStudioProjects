import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avetar Page'),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('sl'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(placeholder: AssetImage('asset/loading.gif'),
            image: NetworkImage('https://arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/J6GFO26LUJAEHGN3AZETUV5SMY.jpg'),
          fadeInDuration: Duration(milliseconds: 700),
        ),
      ),
    );
  }
}