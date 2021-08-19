import 'dart:async';

import 'package:com.example.Taxi4You/Services/calculate_service.dart';
import 'package:com.example.Taxi4You/constants.dart';
import 'package:com.example.Taxi4You/screens/home/bloc/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  String? name;
  String? phone;
  String? email;
  String? abholort;
  String? arkunfsort;
  String? date;
  String? originlatlng;
  String? destinationlatlng;

  ResultPage({
    Key? key,
    required this.abholort,
    required this.arkunfsort,
    required this.date,
    required this.destinationlatlng,
    required this.email,
    required this.name,
    required this.originlatlng,
    required this.phone,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Completer<GoogleMapController> _controller = Completer();
  // List<JezztBuchenApi> responseOfBody = [];
  @override
  Widget build(BuildContext context) {
    // final applicationBloc = Provider.of<ApplicationBloc>(context);
    final responseBodyBloc = Provider.of<CalculateAPI>(context);
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
                  SizedBox(height: 50),
                  // Container(
                  //   padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  //   height: 230,
                  //   child: GoogleMap(
                  //     mapType: MapType.normal,
                  //     myLocationEnabled: false,
                  //     initialCameraPosition: CameraPosition(
                  //         target: LatLng(
                  //             applicationBloc.currentLocation!.latitude,
                  //             applicationBloc.currentLocation!.longitude,),
                  //         zoom: 14.0),
                  //     onMapCreated: (GoogleMapController controller) {
                  //       _controller.complete(controller);
                  //     },
                  //   ),
                  // ),
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
                      enabled: false,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: widget.abholort,
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
                      enabled: false,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: widget.arkunfsort,
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
                        child: Text(
                            responseBodyBloc.resultData.toString() +
                                // CalculateAPI.responseOfBody[index].price +
                                " CF",
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 540, right: 60),
                        child: Text(
                            // CalculateAPI
                            //         .responseOfBody[index].destination +
                            "KM",
                            style:
                                TextStyle(fontSize: 20, color: kPrimaryColor)),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 600, left: 25),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        onPressed: () {},
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
}
