import 'dart:convert';

import 'package:com.example.Taxi4You/constants.dart';
import 'package:com.example.Taxi4You/screens/ListPage_screen/list_page_screen.dart';
import 'package:com.example.Taxi4You/screens/RegisterScreen/register.dart';
import 'package:com.example.Taxi4You/screens/Videos_screen/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gridview_items.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<VideoApiDatas> videos = [];
  getList() async {
    var url =
        Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/get_service_list');
    var response = await http.post(url, body: {"lang": "de"});

    if (response.statusCode == 200) {
      print(response);
      var decode = jsonDecode(response.body);
      videos = videoApiDatasFromJson(jsonEncode(decode["data"]));
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  List data = [
    {
      "color": Color(0xffffffff),
      "text": "Behindertentransport",
      "image": "assets/images/1.png",
    },
    {
      "color": Color(0xffffffff),
      "text": "Flughafen-Transfer",
      "image": "assets/images/2.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Concierge ",
      "image": "assets/images/3.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Reiseplanung",
      "image": "assets/images/4.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Schüler Taxi",
      "image": "assets/images/5.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Roadshows",
      "image": "assets/images/6.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Limousinen Service",
      "image": "assets/images/7.png"
    },
  ];

  final routpages = ['VideosPage', 'SecondPage', 'ListPage'];

  List<Widget> pages = [VideosPage(), ListPageScreen(), SignUpScreen()];

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 236,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/Group 9.png"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Container(
                      child: Text(
                        "Zuverlässiger Service",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                            onPressed: () {
                              _launchUrl();
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 60),
                            color: kPrimaryColor,
                            child: Text(
                              "ANFRAGE ABSCHICKEN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Unsere Leistungen", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: videos.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 31),
                  itemBuilder: (context, index) {
                    return Card(
                      color: data[index]["color"],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              IconButton(
                                  onPressed: () {
                                    if (index == 0) {
                                      _launchUrlVideo1();
                                    } else if (index == 1) {
                                      _launchUrlVideo2();
                                    } else if (index == 4) {
                                      _launchUrlVideo3();
                                    }
                                  },
                                  icon: Image.asset("assets/images/play.png"))
                            ],
                          ),
                          Container(
                            child: Stack(
                              children: [
                                //Image.asset(data[index]["image"]),
                                Container(
                                    height: 70,
                                    child: SvgPicture.network(
                                        videos[index].image)),
                              ],
                            ),
                          ),
                          Text(videos[index].title),
                        ],
                      ),
                    );
                  }),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("Verbreitetes Netzwerk"),
                  Image.asset("assets/images/Group18.png"),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 30),
                    child: Text(
                      "Wir verfügen über ein umfangreiches Netzwerk, das wir kontinuierlich ausbauen. Um unseren Kunden auch bei hoher Auslastung die richtige Servicelösung anbieten zu können, tun wir alles dafür.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  final String postsURL =
      "https://taxiforyou.ch/wp-json/theme/v1/get_service_list";

  // Future<List<GetVideos>> getPosts() async {
  //   Response res = await get(Uri.parse(postsURL));

  //   if (res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body);

  //     List<GetVideos> posts = body
  //         .map(
  //           (dynamic item) => GetVideos.fromJson(item),
  //         )
  //         .toList();

  //     return posts;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }

  void _launchUrl() async => await launch("tel: +41 79 920 70 70");
  void _launchUrlVideo1() async => await launch(
      "https://www.youtube.com/watch?v=3iVDrUJzVZM&ab_channel=TaxiForYou");
  void _launchUrlVideo2() async => await launch(
      "https://www.youtube.com/watch?v=MTY5vmeRMPA&ab_channel=TaxiForYou");
  void _launchUrlVideo3() async => await launch(
      "https://www.youtube.com/watch?v=XarArh0F-Xw&ab_channel=TaxiForYou");

  // _showInfo() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Info"),
  //           content: Text(videos[index].desc),
  //         );
  //       });
  // }

  // _showDialog1() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           actions: [
  //             YoutubePlayer(
  //               controller: _controller1,
  //               showVideoProgressIndicator: true,
  //               progressIndicatorColor: Colors.blue,
  //             )
  //           ],
  //         );
  //       });
  // }
}


//      ListView.builder(
//           itemCount: videos.length,
//           itemBuilder: (context, index) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: <Widget>[
//                       SizedBox(height: 20.0),
//                       VideosInformations(
//                         imageUrl: videos[index].image,
//                         text: videos[index].title,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
// List<VideoApiDatas> videos = [];
//   getList() async {
//     var url =
//         Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/get_service_list');
//     var response = await http.post(url, body: {"lang": "de"});

//     if (response.statusCode == 200) {
//       print(response);
//       var decode = jsonDecode(response.body);
//       videos = videoApiDatasFromJson(jsonEncode(decode["data"]));
//       setState(() {});
//     } else {
//       print(response.reasonPhrase);
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getList();
//   }





// YoutubePlayerController _controller1 = YoutubePlayerController(
//     initialVideoId: '3iVDrUJzVZM',
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: false,
//     ),
//   );
//   YoutubePlayerController _controller2 = YoutubePlayerController(
//     initialVideoId: 'MTY5vmeRMPA',
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: false,
//     ),
//   );
//   YoutubePlayerController _controller3 = YoutubePlayerController(
//     initialVideoId: 'XarArh0F-Xw',
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: false,
//     ),
//   );