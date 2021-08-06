import 'package:flutter/material.dart';

import '../../constants.dart';

class LocationWriteUs extends StatefulWidget {
  const LocationWriteUs({Key? key}) : super(key: key);

  @override
  _LocationWriteUsState createState() => _LocationWriteUsState();
}

class _LocationWriteUsState extends State<LocationWriteUs> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.black))
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset("assets/images/location.png"),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/map.png"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              right: 30,
              left: 30,
              bottom: 0,
              child: Container(
                width: 330,
                height: 390,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: Text("Kontakt", style: TextStyle(fontSize: 25)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90, left: 25),
                      child: Image.asset("assets/images/Group 2.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90, left: 90),
                      child: Text("Ettenhauserstrasse 468620 Wetzikon ZH",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 155, left: 25),
                      child: Image.asset("assets/images/Group 3.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 165, left: 90),
                      child: Text("+41 79 920 70 70",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 215, left: 25),
                      child: Image.asset("assets/images/Group 4.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 225, left: 90),
                      child: Text("+41 79 920 70 70",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 275, left: 25),
                      child: Image.asset("assets/images/Group 5.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 280, left: 90),
                      child: Text("info@taxiforyou.ch",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 330, left: 23),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          onPressed: () {
                            _showDialog();
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 110),
                          color: kPrimaryColor,
                          child: Text(
                            "WRITE US",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text("Write Us"),
            actions: [
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Ihr Name",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Ihr E-Mail",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Phone",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 5,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Nachrict eingeben",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                // ignore: deprecated_member_use
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    padding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 120),
                    color: kPrimaryColor,
                    child: Text(
                      "SEND",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ),
              SizedBox(height: 20),
            ],
          );
        });
  }
}
