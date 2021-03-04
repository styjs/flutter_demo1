import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  Future<void> _selctedDate () async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
    );

    debugPrint("date ${date}");

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _selctedTime () async {
    final TimeOfDay date = await showTimePicker(
      context: context,
      initialTime: selectedTime
    );

    debugPrint("date ${date}");

    if (date == null) return;

    setState(() {
      selectedTime = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: _selctedDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectedDate)),
                      Icon(Icons.arrow_drop_down),
                      Icon(Icons.arrow_drop_down)
                    ],
                  )
                ),
                InkWell(
                  onTap: _selctedTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  )
                )
              ],
            )
          ],
        )
      ),
    );
  }
}