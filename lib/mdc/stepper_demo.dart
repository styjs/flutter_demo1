import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    debugPrint('value $value');
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep++ : _currentStep = 0;
                    debugPrint('value1 $_currentStep');
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 0 ? _currentStep-- : _currentStep = 2;
                    debugPrint('value2 $_currentStep');
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('Esse amet ea qui fugiat est fugiat occaecat laboris irure do ad minim.'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('Minim'),
                    subtitle: Text('Cupidatat commodo'),
                    content: Text('Minim qui cupidatat commodo cupidatat in officia consequat fugiat eiusmod non amet consequat.'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('Ipsum'),
                    subtitle: Text('Ea excepteur'),
                    content: Text('Ipsum ea excepteur eu exercitation sint Lorem occaecat Lorem cillum.'),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}