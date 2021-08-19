import 'package:com.example.Taxi4You/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class PlaceDeneme extends StatefulWidget {
  @override
  _PlaceDenemeState createState() => _PlaceDenemeState();
}

class _PlaceDenemeState extends State<PlaceDeneme> {
  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];
  DetailsResult? detailsResult;

  @override
  void initState() {
    googlePlace = GooglePlace('AIzaSyB8Qgf5m4TlGdQ84QlB52NdIG5zrpw3RmM');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(color: kPrimaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(predictions[index].description!),
                      onTap: () {
                        setState(() {
                          getDetils(predictions[index].placeId!);
                          // debugPrint(predictions[index].placeId);
                          // debugPrint(predictions[index].description);
                          var desc = predictions[index].description;
                          var lat = detailsResult!.geometry!.location!.lat;
                          var lng = detailsResult!.geometry!.location!.lng;
                          List data = [
                            lat, //40.1885281
                            lng,
                            desc //29.0609636
                          ];
                          Navigator.pop(context, data);
                        });
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace!.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  void getDetils(String placeId) async {
    var result = await this.googlePlace!.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      setState(() {
        detailsResult = result.result;
        // print(detailsResult!.geometry!.location!.lng.toString());
        // print(detailsResult!.geometry!.location!.lat.toString());
      });
    }
  }
}
