import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Demo cuentas',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.blue,
          primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            //backgroundColor: Colors.brown,
            title: Text('Prueba de statefullwidget 21'),
          ),
          body: MyButton())));
}

class MyButton extends StatefulWidget {
  MyButton({Key key}) : super(key: key);

  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int _counter = 0;

  void _increment() {
    print('todo cambio 2 3 $_counter ');
    setState(() {
      if (_counter >= 3) {
        _counter = 0;
      } else {
        _counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance, as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    final List<String> text = [
      'hola mundo ',
      'adios mundo',
      'el mundo hijira',
      'todo bien mundo'
    ];
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text[_counter] + ' Count: $_counter',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 40)),
        RaisedButton(
          onPressed: _increment,
          child: Text(
            'aumentando $_counter',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.brown,
        ),
      ],
    )));
  }
}
