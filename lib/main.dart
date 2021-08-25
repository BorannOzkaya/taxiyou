import 'package:com.example.Taxi4You/Services/calculate_service.dart';
import 'package:com.example.Taxi4You/screens/ListPage_screen/list_page_screen.dart';
import 'package:com.example.Taxi4You/screens/Onboard/yedekonboard.dart';
import 'package:com.example.Taxi4You/screens/Videos_screen/videos_screen.dart';
import 'package:com.example.Taxi4You/screens/home/bloc/application_bloc.dart';
import 'package:com.example.Taxi4You/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: providers, child: MyApp()),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CalculateAPI>(create: (_) => CalculateAPI()),
  ChangeNotifierProvider<ApplicationBloc>(create: (_) => ApplicationBloc())
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/home': (context) => HomePage(placeId: ''),
      },
    );
  }
}
