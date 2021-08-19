import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response, get, post;
import 'package:com.example.Taxi4You/constants.dart';

class Apicalisma extends StatefulWidget {
  const Apicalisma({
    Key? key,
  }) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<Apicalisma> {
  late String _gelenCevap;

  Future<void> _getVariables() async {
    String address = "https://jsonplaceholder.typicode.com/posts";
    Response res = await get(Uri.parse(address));

    if (res.statusCode == 200) {
      var _gelenCevap = jsonDecode(res.body);
      var _response = _gelenCevap;
      print(_gelenCevap);
    } else
      _gelenCevap = "Database Error!";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("API Deneme"),
        ),
        body: ListView(
          children: [
            Text("Gelen Cevap :"),
            // ignore: deprecated_member_use
            FlatButton(onPressed: _getVariables, child: Text("Bas")),
            Text(_gelenCevap)
          ],
        ));
  }
}
