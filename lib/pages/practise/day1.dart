import 'package:flutter/material.dart';
import 'package:flutter_study_app/components/return_bar.dart';

class Day1Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Day1State();
  }
}

class Day1State extends State<Day1Screen> {
  DateTime _dateTime =   DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime _picked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2017),
        lastDate: DateTime(2030));

    if (_picked != null) {
      setState(() {
        _dateTime = _picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReturnBar('第1天'),
      body: Center(
          child: RaisedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('第1天'))),
    );
  }
}
