import 'package:flutter/material.dart';

class Hello extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        'hello1',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.red,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}
