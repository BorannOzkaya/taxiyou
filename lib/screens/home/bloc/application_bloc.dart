import 'package:com.example.Taxi4You/Services/geolocator_service.dart';
import 'package:com.example.Taxi4You/Services/place_search.dart';
import 'package:com.example.Taxi4You/Services/place_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeoLocatorService();
  final placeService = PlaceService();

  Position? currentLocation;
  List<PlaceSearch>? searchResults;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    WidgetsFlutterBinding.ensureInitialized();
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    WidgetsFlutterBinding.ensureInitialized();
    searchResults = await placeService.getAutoComplete(searchTerm);
    notifyListeners();
  }
}
