import 'package:car_rental/constants.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  VideoPage() : super();

  final String title = "Maps Demo";
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Page 3"),
      ),
    );
  }
}
