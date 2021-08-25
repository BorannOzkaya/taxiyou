import 'package:com.example.Taxi4You/constants.dart';
import 'package:com.example.Taxi4You/screens/ListPage_screen/list_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Body extends StatefulWidget {
  static String routeName = "/VideosPage";

  @override
  _BodyState createState() => _BodyState();
}

List videos = ["MTY5vmeRMPA", "3iVDrUJzVZM", "XarArh0F-Xw"];

class _BodyState extends State<Body> {
  YoutubePlayerController _controllerLimusin = YoutubePlayerController(
    initialVideoId: '3iVDrUJzVZM',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  YoutubePlayerController _controller2 = YoutubePlayerController(
    initialVideoId: 'MTY5vmeRMPA',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  YoutubePlayerController _controllerSchuler = YoutubePlayerController(
    initialVideoId: 'XarArh0F-Xw',
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
                      child: Text("Behindertentransport",
                          style: TextStyle(fontSize: 20)),
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
                      child: Text("Flughafen Transfer",
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160, left: 260),
                  child: IconButton(
                    icon: Image.asset("assets/images/play.png"),
                    onPressed: () {
                      _showDialog2();
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
                      _showDialog3();
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 80)
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
                controller: _controllerLimusin,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
              )
            ],
          );
        });
  }

  _showDialog2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              YoutubePlayer(
                controller: _controller2,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
              )
            ],
          );
        });
  }

  _showDialog3() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              YoutubePlayer(
                controller: _controllerSchuler,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blue,
              )
            ],
          );
        });
  }
}
