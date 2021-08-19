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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kPrimaryColor,
      //   child: Icon(Icons.dashboard),
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (BuildContext context) {
      //       return VideosPage();
      //     }));
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = ListPage();
      //                   currentTab = 0;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.home,
      //                     color:
      //                         currentTab == 0 ? Color(0xFF3ab4a4) : Colors.grey,
      //                   ),
      //                   Text(
      //                     "Home",
      //                     style: TextStyle(
      //                         color: currentTab == 0
      //                             ? Color(0xFF3ab4a4)
      //                             : Colors.grey),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = WorksPage();
      //                   currentTab = 1;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.paste_outlined,
      //                     color:
      //                         currentTab == 1 ? Color(0xFF3ab4a4) : Colors.grey,
      //                   ),
      //                   Text(
      //                     "Works",
      //                     style: TextStyle(
      //                         color: currentTab == 1
      //                             ? Color(0xFF3ab4a4)
      //                             : Colors.grey),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = VideoPage();
      //                   currentTab = 2;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.date_range,
      //                     color:
      //                         currentTab == 2 ? Color(0xFF3ab4a4) : Colors.grey,
      //                   ),
      //                   Text(
      //                     "Calendar",
      //                     style: TextStyle(
      //                         color: currentTab == 2
      //                             ? Color(0xFF3ab4a4)
      //                             : Colors.grey),
      //                   )
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = ProfilePage();
      //                   currentTab = 3;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.person,
      //                     color:
      //                         currentTab == 3 ? Color(0xFF3ab4a4) : Colors.grey,
      //                   ),
      //                   Text(
      //                     "Profile",
      //                     style: TextStyle(
      //                         color: currentTab == 3
      //                             ? Color(0xFF3ab4a4)
      //                             : Colors.grey),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
