import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class App extends StatefulWidget {
  static String videoID = 'J94mEyVyesc';

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'J94mEyVyesc',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Embed YouTube Video'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            _controller.toggleFullScreenMode();
            return Future.value(false);
          },
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Youtube"),

                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      _showDialog();
                    },
                    child: Text("Video"))
              ],
            ),
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
