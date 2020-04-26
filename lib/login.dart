import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _buildLoginForm() {
    final _formKey = GlobalKey<FormState>();
    const padAmount = 20.0;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(padAmount),
            child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Enter your email"
                ),
              validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(padAmount),
            child: TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Enter your password"
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: padAmount),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Local Login',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login"))
        ),
        body: Column(
          children: <Widget>[_buildLoginForm()],
        ),
      ),
    );
  }
}