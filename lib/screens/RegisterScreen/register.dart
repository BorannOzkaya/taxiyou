import 'package:car_rental/constants.dart';
import 'package:car_rental/screens/RegisterScreen/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text("Register"),
      ),
      body: Body(),
    );
  }
}
