import 'package:car_rental/constants.dart';
import 'package:car_rental/screens/ListPage_screen/list_page_screen.dart';
import 'package:car_rental/screens/RegisterScreen/register.dart';
import 'package:car_rental/screens/Videos_screen/videos_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List data = [
    {
      "color": Color(0xffffffff),
      "text": "Schüler Taxi",
      "image": "assets/images/1.png",
    },
    {
      "color": Color(0xffffffff),
      "text": "Behinderte-ntransport",
      "image": "assets/images/2.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Concierge ",
      "image": "assets/images/3.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Roadshows",
      "image": "assets/images/4.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Schüler Taxi",
      "image": "assets/images/5.png"
    },
    {
      "color": Color(0xffffffff),
      "text": "Reiseplanung",
      "image": "assets/images/6.png"
    },
  ];

  final routpages = ['VideosPage', 'SecondPage', 'ListPage'];

  List<Widget> pages = [VideosPage(), ListPageScreen(), SignUpScreen()];

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
                            onPressed: () {},
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
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 31),
                  itemBuilder: (context, index) {
                    return Card(
                      color: data[index]["color"],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(""),
                                IconButton(
                                    onPressed: () {
                                      print(index);
                                      Navigator.pushNamed(
                                          context, '/${routpages[index]}');
                                    },
                                    icon: Image.asset("assets/images/play.png"))
                              ],
                            ),
                            Image.asset(data[index]["image"]),
                            SizedBox(height: 4.4),
                            Text(data[index]["text"])
                          ],
                        ),
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
}
