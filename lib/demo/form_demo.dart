import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black
        ),
        child: ThemeDemo()
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RegistedForm()
        ]
      ),
    );
  }
}

class RegistedForm extends StatefulWidget {
  @override
  _RegistedFormState createState() => _RegistedFormState();
}

class _RegistedFormState extends State<RegistedForm> {
  final registerKey = GlobalKey<FormState>();
  String username, password;
  bool _autovalidate = false;

  String validateUsername (username)
  {
    if (username.isEmpty) {
      return 'username is required.';
    }
    return null;
  }

  String validatePassword(password)
  {
    if (password.isEmpty) {
      return 'password is required.';
    }
    return null;
  }

  void submitRegisterForm() {
    if (registerKey.currentState.validate()) {
      registerKey.currentState.save();
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering...')
        )
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }


    debugPrint('username $username');
    debugPrint('password $password');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username'
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,
            autovalidate: _autovalidate,
          ),
          TextFormField(
            obscureText: true,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              labelText: 'Password'
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('提交', style: TextStyle(color: Theme.of(context).accentColor),),
              onPressed: submitRegisterForm
            ),
          )

        ]
      ),
    );
  }
}

class TextFiledDemo extends StatefulWidget {
  @override
  _TextFiledDemoState createState() => _TextFiledDemoState();
}

class _TextFiledDemoState extends State<TextFiledDemo> {
  final textEditingController =TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        // onChanged: (value) {
        //   debugPrint('input $value');
        // },
        controller: textEditingController,
        onSubmitted: (value){
          debugPrint('submit ${value}');
        },
        decoration: InputDecoration(
          icon: Icon(Icons.book),
          labelText: 'NIHAO',
          hintText: 'Enter your brife name.',
          // border: OutlineInputBorder()
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.red
        ),
      ),
    );
  }
}