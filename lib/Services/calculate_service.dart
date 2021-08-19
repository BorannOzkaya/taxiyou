import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CalculateAPI with ChangeNotifier {
  List<JezztBuchenApi>? resultData;

  // List<JezztBuchenApi> get responses => responseOfBody;

  CalculateAPI() {
    getcalculateFromApi('', '', '', '');
  }

  Future<CalculateApi> getcalculateFromApi(String origin, String destination,
      String originName, String destinationName) async {
    final http.Response response = await http.post(
      Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/calculate_route'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'origin': origin,
        'origin-name': originName,
        'destination': destination,
        'destination-name': destinationName,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(response.body);

      var price = result['data']['price'];

      print(resultData);
      notifyListeners();
      return CalculateApi.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to create album.');
    }
  }
}

// Calculate API si

CalculateApi calculateApiFromJson(String str) =>
    CalculateApi.fromJson(json.decode(str));

String calculateApiToJson(CalculateApi data) => json.encode(data.toJson());

class CalculateApi {
  CalculateApi(
      {this.origin = "",
      this.destination = "",
      this.originName = "",
      this.destinationName = ""});

  String origin;
  String destination;
  String originName;
  String destinationName;

  factory CalculateApi.fromJson(Map<String, dynamic> json) => CalculateApi(
      origin: json["origin"],
      destination: json["destination"],
      originName: json["origin-name"],
      destinationName: json["destination-name"]);

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "origin-name": originName,
        "destination-name": destinationName
      };
}

// Ayırtma API si

JezztBuchenApi jezztBuchenApiFromJson(String str) =>
    JezztBuchenApi.fromJson(json.decode(str));

String jezztBuchenApiToJson(JezztBuchenApi data) => json.encode(data.toJson());

class JezztBuchenApi with ChangeNotifier {
  JezztBuchenApi({
    required this.name,
    required this.phone,
    required this.email,
    required this.origin,
    required this.originAddress,
    required this.originLat,
    required this.originLng,
    required this.destination,
    required this.destinationAddress,
    required this.destinationLat,
    required this.destinationLng,
    required this.destinationName,
    required this.date,
    required this.price,
    required this.distance,
  });

  String name;
  String phone;
  String email;
  String origin;
  String originAddress;
  String originLat;
  String originLng;
  String destination;
  String destinationAddress;
  String destinationLat;
  String destinationLng;
  String destinationName;
  String date;
  String price;
  String distance;

  factory JezztBuchenApi.fromJson(Map<String, dynamic> json) => JezztBuchenApi(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        origin: json["origin"],
        originAddress: json["origin-address"],
        originLat: json["origin-lat"],
        originLng: json["origin-lng"],
        destination: json["destination"],
        destinationAddress: json["destination-address"],
        destinationLat: json["destination-lat"],
        destinationLng: json["destination-lng"],
        destinationName: json["destination-name"],
        date: json["date"],
        price: json["price"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "origin": origin,
        "origin-address": originAddress,
        "origin-lat": originLat,
        "origin-lng": originLng,
        "destination": destination,
        "destination-address": destinationAddress,
        "destination-lat": destinationLat,
        "destination-lng": destinationLng,
        "destination-name": destinationName,
        "date": date,
        "price": price,
        "distance": distance,
      };
}


// final resultPrice = result['data']['price'];
      // final resultDistance = result['data']['distance'];
      // final resultTravelMode = result['data']['travelMode'];
      // final resultdistanceM = result['data']['distance_m'];
      // final resultOriginAdress = result['data']['origin_address'];
      // final resultOriginName = result['data']['origin_name'];
      // final resultOriginLat = result['data']['origin_lat'];
      // final resultOriginLng = result['data']['origin_lng'];
      // final resultDestinationName = result['data']['destination_name'];
      // final resultDestinationAdress = result['data']['destination_address'];
      // final resultDestinationLat = result['data']['destination_lat'];
      // final resultDestinationLng = result['data']['destination_lng'];
      //responseOfBody = result["data"]["price"];
      // searchResults = result["data"]["price"];