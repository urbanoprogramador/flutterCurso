import 'package:flutter/material.dart';

void main() {
  runApp(
       MaterialApp(
         title:'Demo cuentas',
        theme:ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      
      ),  home:new Center(
          child:new Directionality(
            textDirection: TextDirection.ltr,
            child:new Text('hola mundo 21',style:TextStyle(backgroundColor: Colors.white,fontSize: 30,color: Colors.black)),
          ),
        )
       )
    );
}

