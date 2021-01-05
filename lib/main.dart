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
    home: MyTabs(),
  ));
}

class MyTabs extends StatefulWidget {
  MyTabs({Key key}) : super(key: key);

  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  int _indeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Video Tabs'),
          backgroundColor: Colors.orangeAccent,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'home'),
              Tab(icon: Icon(Icons.ondemand_video), text: 'video'),
              Tab(icon: Icon(Icons.perm_contact_cal), text: 'video')
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }
}
