import 'package:car_rental/screens/ListPage_screen/list_page_screen.dart';
import 'package:car_rental/screens/Onboard/yedekonboard.dart';
import 'package:car_rental/screens/Videos_screen/videos_screen.dart';
import 'package:car_rental/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Rental',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: OnBoardScreen.routeName,
      routes: {
        '/': (context) => HomePage(),
        '/VideosPage': (context) => VideosPage(),
        '/ListPage': (context) => ListPageScreen(),
        '/onboard': (context) => OnBoardScreen(),
      },
    );
  }
}
