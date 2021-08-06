import 'package:flutter/material.dart';

class Items {
  late final Color color;
  late final String image;
  late final String text;

  Items({required this.color, required this.image, required this.text});
}

List<Items> items = [
  Items(
      color: Color(0xffffffff),
      image: "assets/images/1.png",
      text: "Schüler Taxi"),
  Items(
      color: Color(0xffffffff),
      image: "assets/images/2.png",
      text: "Behinderte-ntransport"),
  Items(
      color: Color(0xffffffff),
      image: "assets/images/3.png",
      text: "Concierge "),
  Items(
      color: Color(0xffffffff),
      image: "assets/images/4.png",
      text: "Roadshows"),
  Items(
      color: Color(0xffffffff),
      image: "assets/images/5.png",
      text: "Schüler Taxi"),
  Items(
      color: Color(0xffffffff),
      image: "assets/images/6.png",
      text: "Reiseplanung"),
];

List<Widget> pages = [];
