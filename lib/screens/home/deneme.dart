// To parse this JSON data, do
//
//     final googlePlaceDetailModel = googlePlaceDetailModelFromJson(jsonString);

import 'dart:convert';

GooglePlaceDetailModel googlePlaceDetailModelFromJson(String str) =>
    GooglePlaceDetailModel.fromJson(json.decode(str));

String googlePlaceDetailModelToJson(GooglePlaceDetailModel data) =>
    json.encode(data.toJson());

class GooglePlaceDetailModel {
  GooglePlaceDetailModel(
      {this.origin = "",
      this.destination = "",
      this.originName = "",
      this.destinationName = ""});

  String origin;
  String destination;
  String originName;
  String destinationName;

  factory GooglePlaceDetailModel.fromJson(Map<String, dynamic> json) =>
      GooglePlaceDetailModel(
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
