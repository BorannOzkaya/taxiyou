import 'package:com.example.Taxi4You/screens/DashBoardScreen/calisma1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'body.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return MapCalisma1();
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
          padding: const EdgeInsets.all(100.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
