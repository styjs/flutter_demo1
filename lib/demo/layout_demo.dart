import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBoxDemo();
  }
}

class ConstrainedBoxDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200.0,
            maxWidth: 200.0
          ),
          child: Container(
            color: Color.fromRGBO(3, 54, 255, 1.0)
          ),
        )
      ],
    );
  }
}

class AspectRatioDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16.0/9.0,
          child: Container(
            color: Color.fromRGBO(3, 57, 255, 1.0),
          ),
        )
      ],
    );
  }
}

class StackDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 300,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              ),
            ),
            SizedBox(
              width: 20
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  // borderRadius: BorderRadius.circular(8.0),
                  gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0)
                    ]
                  )
                ),
                child: Icon(Icons.brightness_2_sharp, color: Colors.white, size: 32.0),
              ),
            ),
            Positioned(
              right: 20.0,
              top: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 36.0,
              top: 58.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 6.0,
              top: 82.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 46.0,
              top: 120.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 12.0,
              top: 180.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 50.0,
              top: 235.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 90.0,
              top: 290.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            ),
            Positioned(
              right: 15.0,
              top: 260.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0)
            )
          ]
        )
      ],
    );
  }
}

class IconBadge extends StatelessWidget
{
  final IconData icon;
  final double    size;

  IconBadge(this.icon, {
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
