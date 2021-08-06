import 'package:car_rental/screens/LoacationMAp/location.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          ProductPiece(),
          ProductPiece(),
          ProductPiece(),
          ProductPiece(),
        ],
      ),
    ));
  }
}

class ProductPiece extends StatelessWidget {
  const ProductPiece({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      width: 330,
      height: 280,
      decoration: BoxDecoration(color: Colors.white),
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return LocationWriteUs();
            }));
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    Text("Mercedes S-Klasse", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: Text("HYBRID",
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 20, right: 200),
                child: Text("Details Anzeigen",
                    style: TextStyle(fontSize: 18, color: kPrimaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 145, left: 20),
                child: Text("Kapazität :", style: TextStyle(fontSize: 19)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 175, left: 20),
                child: Text("Gepäck :", style: TextStyle(fontSize: 19)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 145, left: 120),
                child: Text("3 Passagiere", style: TextStyle(fontSize: 19)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 175, left: 120),
                child: Text("2 Passagiere", style: TextStyle(fontSize: 19)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 205, left: 120),
                child: Text("Inklusive Wasser (33 cl)",
                    style: TextStyle(fontSize: 19)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 235, left: 120),
                child: Text("Zuschlag 20.-*", style: TextStyle(fontSize: 19)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Image.asset(
                  "assets/images/Carr.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
