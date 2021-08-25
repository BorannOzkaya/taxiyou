import 'package:com.example.Taxi4You/constants.dart';
import 'package:com.example.Taxi4You/screens/DashBoardScreen/DashBoard.dart';
import 'package:com.example.Taxi4You/screens/Videos_screen/body.dart';
import 'package:com.example.Taxi4You/screens/navbarScreens/videos.dart';
import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget {
  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  int currentTab = 0;

  final List<Widget> screens = [ListPage(), VideoPage()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ListPage();

  Widget landscape() {
    return Center(child: Text("landscape"));
  }

  Widget portait() {
    return Center(child: Text("portrait"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
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
      body: OrientationBuilder(
        builder: (context, orientaion) {
          if (orientaion == Orientation.portrait) {
            return Body();
          } else {
            return landscape();
          }
        },
      ),
    );
  }
}
