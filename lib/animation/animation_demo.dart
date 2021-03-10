
import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this
    );

    curve = CurvedAnimation(parent: animationController, curve: Curves.bounceOut);

    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor = ColorTween(begin: Colors.blue, end: Colors.redAccent).animate(curve);

    // animationController.addListener(() {
    //   // print('${animationController.value}');
    //   setState(() {});
    // });

    animationController.addStatusListener((status) {
      print("$status");
    });

    // animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        [animation, animationColor],
        animationController
      ),
      // child: IconButton(
      //   icon: Icon(Icons.favorite),
      //   iconSize: animation.value,
      //   color: animationColor.value,
      //   onPressed: () {
      //     // animationController.forward();
      //     if (animationController.status == AnimationStatus.completed) {
      //       animationController.reverse();
      //     } else {
      //       animationController.forward();
      //     }
      //   },
      // ),
      // child: Center(
      //   label: Text('${animationController.value}'),
      //   onPressed: () {
      //     animationController.forward();
      //   },
      // ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart(this.animations, this.controller):super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        // animationController.forward();
        if (controller.status == AnimationStatus.completed) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
    );
  }
}