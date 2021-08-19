import 'package:com.example.Taxi4You/constants.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}
