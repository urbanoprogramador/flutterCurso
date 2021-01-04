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
      home: MyTextfield()));
}

class MyTextfield extends StatefulWidget {
  MyTextfield({Key key}) : super(key: key);

  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  String inputValue = '';
  List<Widget> fila = [];
  FocusNode myFocusNode = FocusNode();
  final TextEditingController myControllerText = TextEditingController();
  void onSubmitted(String value) {
    print(value);
    print('vista desde controler: ${myControllerText.text}');
    setState(() {
      fila.add(Text(value));
      myControllerText.clear();
      //myControllerText.
      myFocusNode.requestFocus();
    });
  }

  void deleteElement(int index) {
    print('eliminando $index');
    setState(() {
      fila.removeAt(index);
    });
  }

  void _showAlert() {
    AlertDialog dialog = new AlertDialog(
        content: Text('seguro de que desea limpiar toda la data?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                fila.clear();
              });
              Navigator.of(context).pop();
            },
            child: Text('ok'),
          )
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EdiText widget'),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                OutlineButton(
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    _showAlert();
                  },
                  child: Icon(Icons.delete_sweep),
                ),
                TextField(
                  focusNode: myFocusNode,
                  controller: myControllerText,
                  decoration: InputDecoration(hintText: 'agregar texto aqui'),
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                  onSubmitted: (String value) {
                    onSubmitted(value);
                  },
                ),
                Expanded(
                    //constraints: BoxConstraints(minHeight: 250, maxHeight: 400),
                    //padding: const EdgeInsets.all(8),
                    child: fila.length == 0
                        ? Text('Sin item en la lista')
                        : ListView.builder(
                            //reverse: true,
                            itemCount: fila.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              int stoy = fila.length - 1;
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  fila[stoy - index],
                                  FlatButton.icon(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      deleteElement(stoy - index);
                                    },
                                    label: Text(''),
                                  )
                                ],
                              );
                            },
                          ))
                //Text(this.inputValue)
              ],
            ),
          ),
        ));
  }
}
