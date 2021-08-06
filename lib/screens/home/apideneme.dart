import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response, get, post;

class Body extends StatefulWidget {
  const Body({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String _gelenCevap;

  Future<void> _getVariables() async {
    String address = "https://jsonplaceholder.typicode.com/posts";
    Response res = await get(Uri.parse(address));

    if (res.statusCode == 200) {
      var _gelenCevap = jsonDecode(res.body);
      var _response = _gelenCevap;
      print(_response);
    } else
      _gelenCevap = "Database Error!";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sada")),
    );
  }
}


// ListView(
//       children: [
//         Text("Gelen Cevap :"),
//         // ignore: deprecated_member_use
//         FlatButton(onPressed: _getVariables, child: Text("Bas")),
//       ],
//     );