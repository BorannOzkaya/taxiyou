import 'dart:convert';

import 'package:http/http.dart' as http;

// var request = http.Request(
//     'POST', Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/send_car_form'));

// jezztBuchenPostIslemi() async {
//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }

class JezztBuchenItems {
  final String? name;
  final String? email;
  final String? phone;
  final String? orign;
  final String? originAdress;
  // final String? originLat;
  // final String? originLng;
  // final String? originName;
  final String? destination;
  final String? destinationAdress;
  // final String? destinationLat;
  // final String? destinationLng;
  // final String? destinationName;
  final String? date;
  // final String? rOrigin;
  // final String? rDestination;
  final String? price;
  final String? distance;

  JezztBuchenItems(
      {this.originAdress,
      this.destinationAdress,
      this.price,
      this.distance,
      this.orign,
      // this.originAdress,
      // this.originLat,
      // this.originLng,
      // this.originName,
      this.destination,
      // this.destinationAdress,
      // this.destinationLat,
      // this.destinationLng,
      // this.destinationName,
      this.date,
      // this.rOrigin,
      // this.rDestination,
      // this.price,
      // this.distance,
      this.phone,
      this.name,
      this.email});

  factory JezztBuchenItems.fromJson(Map<String, dynamic> json) {
    return JezztBuchenItems(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      orign: json['origin'],
      originAdress: json['origin-address'],
      // originLat: json['origin-lat'],
      // originLng: json['origin-lng'],
      // originName: json['origin-name'],
      destination: json['destination'],
      destinationAdress: json['destination-address'],
      // destinationLat: json['destination-lat'],
      // destinationLng: json['destination-lng'],
      // destinationName: json['destination-name'],
      date: json['date'],
      // rOrigin: json['r-origin'],
      // rDestination: json['r-destination'],
      price: json['price'],
      distance: json['distance'],
    );
  }
}

Future<JezztBuchenItems> createJezztBuchenPost(
  String name,
  String email,
  String phone,
  String abholort,
  String arkunsoft,
  String date,
  String originAdress,
  String destination,
  String price,
  String distance,
) async {
  final http.Response response = await http.post(
    Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/send_car_form'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'phone': phone,
      'abholort': abholort,
      'arkunsoft': arkunsoft,
      'date': date,
      'originAdress': originAdress,
      'destination': destination,
      'price': price,
      'distance': distance,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return JezztBuchenItems.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed to create album.');
  }
}
