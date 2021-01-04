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
        primarySwatch: Colors.blue,
      ),
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  List<Widget> crear() {
    List<Widget> texto = [];
    for (var i = 0; i < 50; i++) {
      texto.add(Container(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Text(' Posicion numero $i __ 2')));
    }
    return texto;
  }

  @override
  Widget build(BuildContext context) {
    //
    List<Widget> texto = [];
    for (var i = 0; i < 5; i++) {
      texto.add(new Text(' Posicion numero $i'));
    }
    final List lists = crear();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Statless Widget '),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        height: 400,
        child: ListView(children: [
          MYcard(title: 'me gusta flutter 1', icon: Icons.fastfood_sharp),
          MYcard(
            title: 'me gusta flutter 2',
            icon: Icons.expand_more,
            myColor: Colors.purple,
          ),
          MYcard(
              title: 'me gusta flutter 3',
              icon: Icons.fastfood_sharp,
              myColor: Colors.amber),
          MYcard(
              title: 'me gusta flutter 4444444444444',
              icon: Icons.favorite_border),
        ]),
      ),
    );
  }
}

class MYcard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color myColor;

  const MYcard(
      {Key key, this.icon, this.title, this.myColor = Colors.deepOrange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print(this.title)},
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.lightGreen[100],
        ),
        padding: EdgeInsets.all(5),
        child: Card(
          shadowColor: this.myColor,
          child: Column(
            children: [Text(this.title), Icon(this.icon, color: this.myColor)],
          ),
        ),
      ),
    );
  }
}
