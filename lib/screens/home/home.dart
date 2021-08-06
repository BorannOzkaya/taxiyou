import 'package:car_rental/constants.dart';
import 'package:car_rental/screens/DashBoardScreen/DashBoard.dart';
import 'package:car_rental/screens/Onboard/onboard.dart';
import 'package:car_rental/screens/Result/result.dart';
import 'package:car_rental/screens/Videos_screen/videos_screen.dart';
import 'package:car_rental/screens/navbarScreens/Profile/profile.dart';
import 'package:car_rental/screens/navbarScreens/videos.dart';
import 'package:car_rental/screens/navbarScreens/works.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [ListPage(), WorksPage(), VideoPage()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ListPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.dashboard),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ResultPage();
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ListPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color:
                              currentTab == 0 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = WorksPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.paste_outlined,
                          color:
                              currentTab == 1 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Works",
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = VideoPage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          color:
                              currentTab == 2 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Calendar",
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color:
                              currentTab == 3 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
