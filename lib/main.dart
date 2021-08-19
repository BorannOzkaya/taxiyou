import 'package:com.example.Taxi4You/Services/calculate_service.dart';
import 'package:com.example.Taxi4You/screens/ListPage_screen/list_page_screen.dart';
import 'package:com.example.Taxi4You/screens/Onboard/yedekonboard.dart';
import 'package:com.example.Taxi4You/screens/Videos_screen/videos_screen.dart';
import 'package:com.example.Taxi4You/screens/home/bloc/application_bloc.dart';
import 'package:com.example.Taxi4You/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApplicationBloc(),
        ),
        ChangeNotifierProvider(
          create: (context) => CalculateAPI(),
        ),
        ChangeNotifierProvider(
          create: (context) => JezztBuchenApi(
              name: '',
              phone: '',
              email: '',
              origin: '',
              originAddress: '',
              originLat: '',
              originLng: '',
              destination: '',
              destinationAddress: '',
              destinationLat: '',
              destinationLng: '',
              destinationName: '',
              date: '',
              price: '',
              distance: ''),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Taxi4You',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: OnBoardScreen.routeName,
        routes: {
          '/': (context) => HomePage(placeId: ''),
          '/VideosPage': (context) => VideosPage(),
          '/ListPage': (context) => ListPageScreen(),
          '/onboard': (context) => OnBoardScreen(),
        },
      ),
    );
  }
}
