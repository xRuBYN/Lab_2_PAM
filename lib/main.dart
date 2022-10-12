import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDate;

  var now = DateTime.now().year;
  var age;
  var now_month = DateTime.now().month;
  var month;

  void _presentDatePicker() async {
    // showDatePicker is a pre-made funtion of Flutter
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    // .then((pickedDate) {
    // Check if no date is selected
    if (pickedDate == null) {
      return;
    }
    setState(() {
      age = now.
      month = now_month - pickedDate.month;
      // using state so that the UI will be rerendered when date is picked
      _selectedDate = pickedDate;
    });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator Flutter'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          // Show the Date Picker when this button clicked
          Padding(
            padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
            child: ElevatedButton(
              onPressed: _presentDatePicker,
              child: const Text('Select Date'),
            ),
          ),

          // display the selected date
          Container(
            padding: const EdgeInsets.all(30),
            child: Text(
              _selectedDate != null
                  ? "You are : $age year"
                  : 'Select Date',
              style: const TextStyle(fontSize: 30),
            ),
          )
        ]),
      )
    );
  }
}
