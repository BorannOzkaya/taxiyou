import 'package:car_rental/constants.dart';
import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({
    Key? key,
  }) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("API Deneme"),
      ),
    );
  }
}
