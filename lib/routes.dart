import 'package:car_rental/screens/ListPage_screen/list_page_screen.dart';
import 'package:car_rental/screens/Onboard/yedekonboard.dart';
import 'package:car_rental/screens/home/home.dart';
import 'package:car_rental/screens/sign_screen/sigin_screen.dart';
import 'package:car_rental/screens/splas_screen/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  HomePage.routeName: (context) => HomePage(),
  OnBoardScreen.routeName: (context) => OnBoardScreen(),
  ListPageScreen.routeName: (context) => ListPageScreen(),
};
