import 'package:com.example.Taxi4You/Services/calculate_service.dart';
import 'package:com.example.Taxi4You/Services/jezzt_buchen_api.dart';
import 'package:com.example.Taxi4You/screens/DashBoardScreen/DashBoard.dart';
import 'package:com.example.Taxi4You/screens/ListPage_screen/list_page_screen.dart';
import 'package:com.example.Taxi4You/screens/Result/result.dart';
import 'package:com.example.Taxi4You/screens/Write_us_screen/location.dart';
import 'package:com.example.Taxi4You/screens/home/place_search.dart';
import 'package:com.example.Taxi4You/screens/home/place_search2.dart';
import 'package:com.example.Taxi4You/screens/navbarScreens/Profile/profile.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

import '../../constants.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  final String placeId;

  HomePage({Key? key, required this.placeId}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(this.placeId);
}

const kGoogleApiKey = "AIzaSyBQk1vGVX87g5OcxBEnbpWHisYN1gJPdts";

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [ListPage(), ListPageScreen()];

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _abholortcontroller = TextEditingController();
  TextEditingController _arkunsoftcontroller = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _originlatlngcontroller = TextEditingController();
  TextEditingController _destinationlatlngcontroller = TextEditingController();

  Future<CalculateApi>? _calculateApi;

  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];
  DetailsResult? detailsResult;

  final String placeId;

  _HomePageState(this.placeId);

  String? name;
  String? email;
  String? phone;
  String? abholort;
  String? arkunsoft;
  String? date;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.dashboard),
        onPressed: () {
          getDetils(this.placeId);
          _showDialog();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ListPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color:
                              currentTab == 0 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = LocationWriteUs();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color:
                              currentTab == 1 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Contact",
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ListPageScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.car_rental,
                          color:
                              currentTab == 2 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Our fleets",
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color:
                              currentTab == 3 ? Color(0xFF3ab4a4) : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Color(0xFF3ab4a4)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _showDialog() {
    // _calculateapi!.getcalculateFromApi();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              scrollable: true,
              title: Text("Jetzt Buchen"),
              actions: [
                TextField(
                  controller: _namecontroller,
                  onChanged: (newValue) => name = newValue,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _phonecontroller,
                  onChanged: (newValue) => phone = newValue,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _emailcontroller,
                  onChanged: (newValue) => email = newValue,
                  decoration: InputDecoration(
                    hintText: "E-Mail",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                    controller: _abholortcontroller,
                    decoration: InputDecoration(
                      hintText: "Abholort*",
                      suffixIcon: Icon(Icons.location_on, color: kPrimaryColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    onTap: () {
                      getDetils(placeId);
                      _navigateAndDisplaySelection(context);
                    }),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 13),
                TextField(
                    controller: _arkunsoftcontroller,
                    onChanged: (newValue) => arkunsoft = newValue,
                    decoration: InputDecoration(
                      hintText: "Ankunftsort*",
                      suffixIcon: Icon(Icons.location_on, color: kPrimaryColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    onTap: () {
                      _navigateAndDisplaySelectionforArkunsoft(context);
                    }),
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
                        setState(() {
                          _calculateApi = CalculateAPI().getcalculateFromApi(
                            _originlatlngcontroller.text,
                            _destinationlatlngcontroller.text,
                            _abholortcontroller.text,
                            _arkunsoftcontroller.text,
                          );
                        });
                        _navigateAndDisplayResultPage(context);
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 60),
                      color: kPrimaryColor,
                      child: Text(
                        "ANFRAGE ABSCHICKEN",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        });
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaceDeneme()),
    );
    _originlatlngcontroller.value =
        TextEditingValue(text: '${result[0]},${result[1]}');
    _abholortcontroller.value = TextEditingValue(text: '${result[2]}');
  }

  void _navigateAndDisplayResultPage(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultPage(
                abholort: _abholortcontroller.text,
                arkunfsort: _arkunsoftcontroller.text,
                date: _datecontroller.text,
                destinationlatlng: _destinationlatlngcontroller.text,
                email: _emailcontroller.text,
                name: _namecontroller.text,
                originlatlng: _originlatlngcontroller.text,
                phone: _phonecontroller.text,
              )),
    );
  }

  void _navigateAndDisplaySelectionforArkunsoft(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaceDeneme2()),
    );
    _destinationlatlngcontroller.value =
        TextEditingValue(text: '${result[0]},${result[1]}');
    _arkunsoftcontroller.value = TextEditingValue(text: '${result[2]}');
  }

  void getDetils(String placeId) async {
    var result = await this.googlePlace!.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      setState(() {
        detailsResult = result.result;
      });
    }
    _namecontroller.value = TextEditingValue(
        text: detailsResult!.geometry!.location!.lat.toString());
    print(detailsResult!.geometry!.location!.lat.toString());
    _phonecontroller.value = TextEditingValue(
        text: detailsResult!.geometry!.location!.lng.toString());
    print(detailsResult!.geometry!.location!.lng.toString());
  }

  void getDetilssecond(String placeId) async {
    var result = await this.googlePlace!.details.get(placeId);
    if (result != null && result.result != null && mounted) {
      setState(() {
        detailsResult = result.result;
      });
    }
    _emailcontroller.value = TextEditingValue(
        text: detailsResult!.geometry!.location!.lat.toString());
    _datecontroller.value = TextEditingValue(
        text: detailsResult!.geometry!.location!.lng.toString());
  }
}
