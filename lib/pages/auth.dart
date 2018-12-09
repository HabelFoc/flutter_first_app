import 'package:flutter/material.dart';

import '../nature_manager.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Login'),
        ),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.lightBlue,
            onPressed: () {
              // Redirect to main Natures screen
              Navigator.pushReplacementNamed(
                context,
                '/admin',
              );
            },
            child: Text(
              'LOGIN',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
