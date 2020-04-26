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
    TextEditingController userEmail = new TextEditingController();
    TextEditingController userPassword = new TextEditingController();
    final _formKey = GlobalKey<FormState>();
    const padAmount = 20.0;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAFormField(label: "email", controller: userEmail),
          _buildAFormField(label: "password", controller: userPassword, obscureText: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  print (userEmail.text);
                  _read();
                  Navigator.pushNamed(context, '/Stream');
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
        body: ListView(
          children: <Widget>[_buildLoginForm()],
        ),
      ),
    );
  }
}

_read() async {

}

Widget _buildAFormField({String label, TextEditingController controller, obscureText = false}) {
  const padAmount = 20.0;
  return Padding(
      padding: const EdgeInsets.all(padAmount),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: new InputDecoration(
          hintText: "Enter your $label",
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter your $label";
          }
          return null;
        },
      )
  );
}