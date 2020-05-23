import 'package:flutter/material.dart';
import 'BLOCS/DatabaseBloc.dart';
import 'ClientModel.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Widget _buildLoginForm() {
    TextEditingController userName = new TextEditingController();
    TextEditingController userPassword = new TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAFormField(label: "name", controller: userName),
          _buildAFormField(label: "password", controller: userPassword, obscureText: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                 final destination = _read(userName.text, userPassword.text, context);
                 destination.then((response) {
                   Navigator.pushNamed(context, response);
                 });
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

Future<String> _read(String lastName, String password, BuildContext context) async {
  final bloc = ClientsBloc();
  if (await bloc.getRowByName(lastName) != null) {
    return '/';
  } else {
    return '/Login';
  }
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