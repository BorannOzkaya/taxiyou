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
  String? originlat;
  String? originlng;
  String? destinationlat;
  String? destinationlng;

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
    required this.originlat,
    required this.originlng,
    required this.destinationlat,
    required this.destinationlng,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Completer<GoogleMapController> _controller = Completer();
  CalculateAPI gs = CalculateAPI();

  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(
        Duration(milliseconds: 420),
        (Timer t) => WidgetsBinding.instance!
            .addPostFrameCallback((_) => fonksiyonCalistir()));
    super.initState();
  }

  Future fonksiyonCalistir() async {
    // await Future.delayed(Duration(seconds: 2));
    if (this.mounted) {
      await CalculateAPI().getcalculateFromApi(
        widget.originlatlng.toString(),
        widget.destinationlatlng.toString(),
        widget.abholort.toString(),
        widget.arkunfsort.toString(),
      );
      final responseBody = Provider.of<CalculateAPI>(context, listen: false);
      price = responseBody.resultData;
      destination = responseBody.resultDestination;
      print("Calisti");
      print(price);
      print(destination);
    }
  }

  @override
  void dispose() {
    fonksiyonCalistir();

    super.dispose();
    timer?.cancel();
  }

  var price;
  var destination;

  Future refrehList() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    // final responseBodyBloc = Provider.of<CalculateAPI>(context, listen: false);
    Provider.of<CalculateAPI>(context).getcalculateFromApi(
        widget.originlatlng.toString(),
        widget.destinationlatlng.toString(),
        widget.abholort.toString(),
        widget.arkunfsort.toString());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Result"),
        backgroundColor: kPrimaryColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: RefreshIndicator(
        onRefresh: refrehList,
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 342,
                height: 680,
                color: Colors.white,
                child: Stack(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      height: 230,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: false,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              applicationBloc.currentLocation!.latitude,
                              applicationBloc.currentLocation!.longitude,
                            ),
                            zoom: 14.0),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
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
                          child: Consumer<CalculateAPI>(
                            builder: (context, gs, child) {
                              return FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 10)),
                                  builder: (c, s) => s.connectionState ==
                                          ConnectionState.done
                                      ? Text(
                                          price.toString() +
                                              // CalculateAPI.responseOfBody[index].price +
                                              " CF",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: kPrimaryColor))
                                      : Text("loading"));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 540, right: 60),
                          child: Consumer<CalculateAPI>(
                            builder: (context, gs, child) {
                              return FutureBuilder(
                                  future: Future.delayed(Duration(seconds: 10)),
                                  builder: (c, s) => s.connectionState ==
                                          ConnectionState.done
                                      ? Text(
                                          destination.toString() +
                                              // CalculateAPI.responseOfBody[index].price +
                                              " KM",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: kPrimaryColor))
                                      : Text("loading"));
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 580, left: 25),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          onPressed: () async {
                            if (mounted) {
                              setState(() {
                                gs.getjezztBuchenFromApi(
                                    widget.abholort.toString(),
                                    destination,
                                    widget.arkunfsort.toString(),
                                    widget.arkunfsort.toString(),
                                    widget.name.toString(),
                                    widget.phone.toString(),
                                    widget.email.toString(),
                                    widget.originlat.toString(),
                                    widget.originlng.toString(),
                                    widget.date.toString(),
                                    widget.destinationlat.toString(),
                                    widget.destinationlng.toString(),
                                    widget.abholort.toString(),
                                    price);
                              });
                              Future.delayed(Duration(seconds: 11), () {
                                sucsessDialog();
                              });
                            }
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 65),
                          color: kPrimaryColor,
                          child: Text(
                            "Berechnen und senden",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 640, left: 20),
                      child: Text(
                          "Bitte warten Sie, wenn Sie bereits gebucht haben"),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 658),
                    //   child: buildTimer(),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  sucsessDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/success.png")),
                Text(
                  "Sucsess",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ],
            ),
            actions: [
              Column(
                children: [
                  Text(
                    "Ihre Anfrage wurde erfolgreich eingereicht. Sie werden so schnell wie möglich kontaktiert.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(
                    color: Colors.green,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        int counter = 0;
                        // Navigator.pushReplacementNamed(context, '/home');
                        Navigator.of(context).popUntil((_) => counter++ >= 2);
                      },
                      child: Text(
                        "Go Home Page",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bitte rechtzeitig erneut senden "),
        TweenAnimationBuilder(
          tween: Tween(begin: 45, end: 0),
          duration: Duration(seconds: 45),
          builder: (_, value, child) => Text(
            "00:${value.toString()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

// print(responseBodyBloc.resultData.toString());
                          // gs.getcalculateFromApi(
                          //     widget.originlatlng.toString(),
                          //     widget.destinationlatlng.toString(),
                          //     widget.abholort.toString(),
                          //     widget.arkunfsort.toString());

                          // price = gs.resultData;
                          // destination = gs.resultDestination;
                          // print(gs.resultData);