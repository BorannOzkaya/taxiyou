import 'dart:async';
import 'dart:convert';

import 'package:com.example.Taxi4You/screens/home/bloc/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'kontakt_api.dart';

class LocationWriteUs extends StatefulWidget {
  const LocationWriteUs({Key? key}) : super(key: key);

  @override
  _LocationWriteUsState createState() => _LocationWriteUsState();
}

class _LocationWriteUsState extends State<LocationWriteUs> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _messagecontroller = TextEditingController();

  Future<KontaktItems>? _kontaktitems;

  String? name;
  String? email;
  String? phone;
  String? notes;
  List<KontaktItems> items = [];
  getKontakt() async {
    var url =
        Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/get_service_list');
    var response = await http.post(url, body: {"lang": "de"});

    if (response.statusCode == 200) {
      print(response);
      var decode = jsonDecode(response.body);
      items = kontaktItemsFromJson(jsonEncode(decode["data"]));
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    super.initState();
    getKontakt();
  }

  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
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
              child: GoogleMap(
                markers: {if (_origin != null) _origin!},
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                initialCameraPosition: CameraPosition(
                    target: LatLng(47.32725427328162, 8.808037952440761),
                    zoom: 11.0),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Positioned(
              right: 30,
              left: 30,
              bottom: 0,
              child: Container(
                width: 330,
                height: 415,
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
                    SizedBox(height: 30)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Marker? _origin;

  void addMArker() {
    setState(() {
      _origin = Marker(
        markerId: MarkerId('origin'),
        infoWindow: InfoWindow(title: 'Taxi For You'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: LatLng(47.32725427328162, 8.808037952440761),
      );
    });
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              scrollable: true,
              title: Text("Write Us"),
              actions: [
                TextField(
                  controller: _namecontroller,
                  onChanged: (newValue) => name = newValue,
                  decoration: InputDecoration(
                    hintText: "Ihr Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailcontroller,
                  onChanged: (newValue) => email = newValue,
                  decoration: InputDecoration(
                    hintText: "Ihr E-Mail",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _phonecontroller,
                  onChanged: (newValue) => phone = newValue,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _messagecontroller,
                  maxLines: 5,
                  onChanged: (newValue) => notes = newValue,
                  decoration: InputDecoration(
                    hintText: "Nachrict eingeben",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor)),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _kontaktitems = createKontakPost(
                            _namecontroller.text,
                            _emailcontroller.text,
                            _phonecontroller.text,
                            _messagecontroller.text,
                          );
                        });
                        _showMessage();
                        //Navigator.of(context).pop();
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
            ),
          );
        });
  }

  _showMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Result"),
            actions: [
              // ListView.builder(itemBuilder: (context, index) {
              //   return Text(items[index].message);
              // })
            ],
          );
        });
  }
}
