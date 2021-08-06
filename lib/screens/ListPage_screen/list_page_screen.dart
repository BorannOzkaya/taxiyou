import 'package:car_rental/screens/DashBoardScreen/DashBoard.dart';
import 'package:car_rental/screens/ListPage_screen/body.dart';
import 'package:car_rental/screens/navbarScreens/videos.dart';
import 'package:car_rental/screens/navbarScreens/works.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ListPageScreen extends StatefulWidget {
  static String routeName = "/ListPage";
  @override
  _ListPageScreenState createState() => _ListPageScreenState();
}

class _ListPageScreenState extends State<ListPageScreen> {
  int currentTab = 0;

  final List<Widget> screens = [ListPage(), WorksPage(), VideoPage()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ListPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unsere Flotte"),
        backgroundColor: kPrimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
