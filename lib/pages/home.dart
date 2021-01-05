import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      child: Center(
          child: Column(
        children: [
          Icon(Icons.home, size: 70, color: Colors.redAccent),
          Text('Usted esta en home', style: TextStyle(color: Colors.white))
        ],
      )),
    );
  }
}
