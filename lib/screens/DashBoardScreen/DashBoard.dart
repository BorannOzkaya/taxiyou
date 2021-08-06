import 'package:car_rental/screens/navbarScreens/works_body.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Apicalisma();
                }));
              },
              icon: Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Icon(Icons.search),
              ))
        ],
        backgroundColor: Color(0xFF3ab4a4),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(110.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
