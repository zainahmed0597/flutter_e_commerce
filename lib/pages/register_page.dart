import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _username, _email, _password;

  Widget _showTitle() {
    return Text(
      'Register',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _showUsernameInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _username = val,
        validator: (val) => val.length < 6 ? 'Username to short' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
          hintText: 'Enter username, min length 6',
          icon: Icon(
            Icons.face,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (val) => _email = val,
        validator: (val) => !val.contains('@') ? 'Invalid Email' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter a valid email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _password = val,
        validator: (val) => val.length < 6 ? 'Username to short' : null,
        obscureText: _obscureText,
        decoration: InputDecoration(
          suffix: GestureDetector(
            onTap: () {
              setState(() => _obscureText = !_obscureText);
            },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter password, min length 6',
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showFormActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          RaisedButton(
            child: Text(
              'Submit',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black),
            ),
            elevation: 8.0,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            )),
            onPressed: _submit,
          ),
          FlatButton(
            child: Text('Existing user? Login'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }

  void _submit() {
    final form = _formkey.currentState;
    if (form.validate()) {
      form.save();
      // print('Username: $_username, Email: $_email, Password: $_password');
      _registerUSer();
    }
  }

void _registerUSer()async{
  http.Response response = await http.post(
      'http://localhost:1337/auth/local/register',
      body: {"username":_username, "email":_email, "password":_password});
  final responseData = json.decode(response.body);
  print(responseData);
}
//response working on web not on emulator or any device

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  _showTitle(),
                  _showUsernameInput(),
                  _showEmailInput(),
                  _showPasswordInput(),
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
