import 'package:car_rental/constants.dart';
import 'package:car_rental/screens/ListPage_screen/list_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Body extends StatefulWidget {
  static String routeName = "/VideosPage";

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'VWrJkx6O0L8',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 35, right: 30),
            width: 315,
            height: 200,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Stack(
              children: [
                Image.asset("assets/images/Mask Group 3.png"),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Schüler Taxi", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 260),
                  child: IconButton(
                    icon: Image.asset("assets/images/play.png"),
                    onPressed: () {
                      _showDialog();
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 35, right: 30),
            width: 315,
            height: 200,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Stack(
              children: [
                Image.asset("assets/images/Mask Group 4.png"),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Schüler Taxi", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 260),
                  child: IconButton(
                    icon: Image.asset("assets/images/play.png"),
                    onPressed: () {
                      _showDialog();
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 35, right: 30),
            width: 315,
            height: 200,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Stack(
              children: [
                Image.asset("assets/images/Mask Group 5.png"),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Schüler Taxi", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 260),
                  child: IconButton(
                    icon: Image.asset("assets/images/play.png"),
                    onPressed: () {
                      _showDialog();
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 35, right: 30),
            width: 330,
            height: 200,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Schüler Taxi", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 260),
                  child: IconButton(
                    icon: Image.asset("assets/images/play.png"),
                    onPressed: () {
                      _showDialog();
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 35, right: 30),
            width: 330,
            height: 200,
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Schüler Taxi", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 260),
                  child: IconButton(
                    icon: Image.asset("assets/images/play.png"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ListPageScreen();
                      }));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
              )
            ],
          );
        });
  }
}
