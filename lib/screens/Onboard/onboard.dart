// import 'package:car_rental/constants.dart';
// import 'package:car_rental/screens/sign_screen/sigin_screen.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

// class OnBoardScreen extends StatefulWidget {
//   static String routeName = "/onboard";

//   @override
//   _OnBoardScreenState createState() => _OnBoardScreenState();
// }

// class _OnBoardScreenState extends State<OnBoardScreen> {
//   dynamic _current = 0;
//   final CarouselController _controller = CarouselController();

//   List imgList = [
//     "assets/images/Phone Left 2.png",
//     "assets/images/Phone Medium.png",
//     "assets/images/Phone Right.png"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: 400,
//             decoration: BoxDecoration(color: Color(0xFF4aa599)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 265, top: 680),
//             child: Container(
//                 // ignore: deprecated_member_use
//                 child: FlatButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (BuildContext context) {
//                   return SignInScreen();
//                 }));
//               },
//               child: Image.asset("assets/images/Button.png"),
//             )),
//           ),
//           Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 60.0),
//                   child: CarouselSlider(
//                     //items: imageSliders,
//                     carouselController: _controller,
//                     options: CarouselOptions(
//                         height: 450.0,
//                         initialPage: 1,
//                         enableInfiniteScroll: false,
//                         autoPlay: false,
//                         autoPlayInterval: Duration(seconds: 3),
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enlargeCenterPage: false,
//                         scrollDirection: Axis.horizontal,
//                         viewportFraction: 0.6,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _current = index;
//                           });
//                         }),
//                   ),
//                 ),
//           Padding(
//             padding: const EdgeInsets.only(top: 620, left: 50, right: 50),
//             child: Text(
//               "Die Taxi- und Limousinenbranche ist gesättigt mit Fahrerinnen und Fahrern der gleichen Klasse. Wir versprechen Zuverlässigkei",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
          
//         ],
//       )])
//       );
      
//   }
// // final List<Widget> imageSliders = imgList.map((item) => Container(
// //             child: Container(
// //               child: ClipRRect(
// //                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //                   child: Stack(
// //                     children: <Widget>[
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           image: DecorationImage(
// //                             image: AssetImage(item),
// //                           ),
// //                         ),
// //                       ),
// //                       Positioned(
// //                         bottom: 0.0,
// //                         left: 0.0,
// //                         right: 0.0,
// //                         child: Container(
// //                           padding: EdgeInsets.symmetric(
// //                               vertical: 10.0, horizontal: 20.0),
                          
// //                         ),
// //                       ),
// //                     ],
// //                   )),
// //             ),
// //           ))
// //       .toList();
  
// }





// // CarouselSlider(
// //                 options: CarouselOptions(
// //                     height: 450,
// //                     enlargeCenterPage: false,
// //                     viewportFraction: 0.65,
// //                     enableInfiniteScroll: false,
// //                     autoPlay: true),
// //                 items: generateImagesTiles(),
// //               ),

// // Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: imgList.map((url) {
// //               int index = imgList.indexOf(url);
// //               return Container(
// //                 width: 8.0,
// //                 height: 8.0,
// //                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
// //                 decoration: BoxDecoration(
// //                   shape: BoxShape.circle,
// //                   color: _current == index
// //                       ? Color.fromRGBO(0, 0, 0, 0.9)
// //                       : Color.fromRGBO(0, 0, 0, 0.4),
// //                 ),
// //               );
// //             }).toList(),
// //           ),