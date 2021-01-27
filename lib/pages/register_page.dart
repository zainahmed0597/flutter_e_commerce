import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  Widget _showEmailinput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
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
        obscureText: true,
        decoration: InputDecoration(
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
            onPressed: () {},
          ),
          FlatButton(
            child: Text('Existing user? Login'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

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
              child: Column(
                children: [
                  _showTitle(),
                  _showUsernameInput(),
                  _showEmailinput(),
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
