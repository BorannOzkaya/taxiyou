import 'package:car_rental/screens/sign_screen/sigin_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List imgList = [
  "assets/images/Phone Left 2.png",
  "assets/images/Phone Medium.png",
  "assets/images/Phone Right.png"
];

class OnBoardScreen extends StatefulWidget {
  static String routeName = "/onboard";
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0XFF33BCAA),
                  Color(0xFF4E948B),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: 450.0,
                        initialPage: 1,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.6,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
                  child: Text(
                    "Die Taxi- und Limousinenbranche \nist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 13.0,
                          height: 13.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Color(0xffA9A9A9),
                                shape: BoxShape.circle),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 20.0,
              bottom: 20.0,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SignInScreen();
                  }));
                },
                child: Image.asset("assets/images/Button.png"),
              )),
        ],
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          //
                          // child: Text(
                          //   'No. ${imgList.indexOf(item)} image',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20.0,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
}
