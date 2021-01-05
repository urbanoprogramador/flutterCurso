import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Icon(Icons.contact_phone, size: 70, color: Colors.amberAccent),
          Text('Usted esta en Contactos')
        ],
      )),
    );
  }
}
