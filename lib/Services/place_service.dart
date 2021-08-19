import 'dart:convert';

import 'package:com.example.Taxi4You/Services/place_search.dart';
import 'package:http/http.dart';

class PlaceService {
  final key = 'AIzaSyCfTIXxDwxLdWxVIwb8oq7Vuo2mILrcSlQ';

  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/xml?input=Amoeba&types=establishment&location=37.76999,-122.44696&radius=500&key=AIzaSyB8Qgf5m4TlGdQ84QlB52NdIG5zrpw3RmM';
    var response = await get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
