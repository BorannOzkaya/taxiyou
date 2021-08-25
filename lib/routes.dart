import 'package:com.example.Taxi4You/screens/ListPage_screen/list_page_screen.dart';
import 'package:com.example.Taxi4You/screens/Onboard/yedekonboard.dart';
import 'package:com.example.Taxi4You/screens/home/home.dart';
import 'package:com.example.Taxi4You/screens/sign_screen/sigin_screen.dart';
import 'package:com.example.Taxi4You/screens/splas_screen/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomePage.routeName: (context) => HomePage(placeId: ''),
  OnBoardScreen.routeName: (context) => OnBoardScreen(),
  ListPageScreen.routeName: (context) => ListPageScreen(),
};
