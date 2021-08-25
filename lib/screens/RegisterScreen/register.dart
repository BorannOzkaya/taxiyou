import 'package:com.example.Taxi4You/constants.dart';
import 'package:com.example.Taxi4You/screens/RegisterScreen/body.dart';
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
