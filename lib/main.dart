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

  List<Step> _myStep = [
    Step(
      title: Text('paso uno'),
      isActive: true,
      state: StepState.editing,
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
    Step(
      title: Text('paso dos'),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          )
        ],
      ),
    ),
    Step(
      title: Text('paso tres'),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          )
        ],
      ),
    ),
    Step(
      title: Text('paso cuatro'),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Home Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          )
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Demo stepper'),
          ),
          body: Container(
            child: Stepper(
              //type: StepperType.horizontal,
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
