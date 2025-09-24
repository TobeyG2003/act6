import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;
  bool liftoff = false;
  Color status = Colors.red;

  void incrementCounter() {
    setState(() {
      if (_counter < 100) {
      _counter++;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (_counter > 0) {
      _counter--;
      }
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void setStatus() {
    setState(() {
      if (_counter == 100) {
        liftoff = true;
      } else {
        liftoff = false;
      }
      if (_counter > 50) {
        status = Colors.green;
      } else if (_counter >= 1) {
        status = Colors.orange;
      } else {
        status = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
//set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              child: Text(
                //to displays current number
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
