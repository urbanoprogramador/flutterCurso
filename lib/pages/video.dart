import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  const Video({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Icon(Icons.ondemand_video, size: 70, color: Colors.amberAccent),
          Text('Usted esta en Video')
        ],
      )),
    );
  }
}
