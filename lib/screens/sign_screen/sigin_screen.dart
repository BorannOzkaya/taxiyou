import 'package:flutter/material.dart';

import 'body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Color(0xFF3ab4a4),
      ),
      body: Body(),
    );
  }
}
