import 'package:car_rental/constants.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: kPrimaryColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: 342,
              height: 680,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          image: DecorationImage(
                              image: AssetImage("assets/images/minimap.png")),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250, left: 20),
                    child: Text("Abholort",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 290, left: 20, right: 20),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Sydney",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 370, left: 20),
                    child: Text("Ankunftsort",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 410, left: 20, right: 20),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Sydney",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 490, left: 20),
                        child: Text("Price",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 490, right: 60),
                        child: Text("Enturnung",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 540, left: 20),
                        child: Text("6 CHF",
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 540, right: 60),
                        child: Text("0.0 KM",
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 600, left: 25),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        onPressed: () {
                          _showDialog();
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 100),
                        color: kPrimaryColor,
                        child: Text(
                          "Jetzt Buchen",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text("Jetzt Buchen"),
            actions: [
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Name",
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
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "E-Mail",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Abholort*",
                  suffixIcon: Icon(Icons.location_on, color: kPrimaryColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Ankunftsort*",
                  suffixIcon: Icon(Icons.location_on, color: kPrimaryColor),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              DateTimeFormField(
                decoration: InputDecoration(
                  hintText: "Datum/Uhrzeit*",
                  suffixIcon: Icon(Icons.date_range, color: kPrimaryColor),
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
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                    color: kPrimaryColor,
                    child: Text(
                      "ANFRAGE ABSCHICKEN",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
              ),
              SizedBox(height: 20),
            ],
          );
        });
  }
}

// TextField(
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   hintText: "Datum/Uhrzeit*",
//                   suffixIcon: Icon(Icons.date_range, color: kPrimaryColor),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey)),
//                 ),
//               ),

//MediaQuery.of - 50 minheitg