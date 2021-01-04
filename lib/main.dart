import 'package:fa_stepper/fa_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: MyStepper()));
}

class MyStepper extends StatefulWidget {
  MyStepper({Key key}) : super(key: key);

  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  bool complete = false;

  final nombre = TextEditingController();

  FAStepperType _stepperType = FAStepperType.horizontal;

  next() {
    _currentStep + 1 != _myStep.length
        ? goTo(_currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  List<FAStep> _myStep = [
    FAStep(
      title: Text('paso uno'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Correo Electronico'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'PassWord'),
          )
        ],
      ),
    ),
    FAStep(
      title: Text('paso dos'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address 1'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode 1'),
          )
        ],
      ),
    ),
    FAStep(
      title: Text('paso tres'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address 2'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode 2'),
          )
        ],
      ),
    ),
    FAStep(
      title: Text('paso cuatro'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address 3'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode3'),
          )
        ],
      ),
    ),
    FAStep(
      title: Text('paso cinco'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address 4'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode 4'),
          )
        ],
      ),
    ),
    FAStep(
      title: Text('paso seis'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address 5'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode 5'),
          )
        ],
      ),
    ),
    FAStep(
      title: Text('paso siete'),
      isActive: true,
      state: FAStepstate.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home 9'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode9'),
          )
        ],
      ),
    )
  ];

  _cambiarType() {
    setState(() {
      _stepperType = _stepperType == FAStepperType.vertical
          ? FAStepperType.horizontal
          : FAStepperType.vertical;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: _cambiarType,
            child: Icon(Icons.update),
          ),
          appBar: AppBar(
            title: Text('Demo stepper'),
          ),
          body: Container(
            child: FAStepper(
              type: _stepperType,
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: onStepCancel,
                      child: const Text('Atras'),
                    ),
                    TextButton(
                      onPressed: onStepContinue,
                      child: const Text('Siguiente'),
                    ),
                  ],
                );
              },
              currentStep: _currentStep,
              steps: _myStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          )),
    );
  }
}
