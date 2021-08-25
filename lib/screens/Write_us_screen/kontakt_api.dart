import 'dart:convert';
import 'package:http/http.dart' as http;

//Kontakt Form API Request

var request = http.Request(
    'POST', Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/contact_form'));

kontaktPostIslemi() async {
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

class KontaktItems {
  final String? name;
  final String? email;
  final String? phone;
  final String? message;

  KontaktItems(
      {required this.phone,
      required this.message,
      required this.name,
      required this.email});

  factory KontaktItems.fromJson(Map<String, dynamic> json) {
    return KontaktItems(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      message: json['message'],
    );
  }
}

List<KontaktItems> kontaktItemsFromJson(String str) => List<KontaktItems>.from(
    json.decode(str).map((x) => KontaktItems.fromJson(x)));

Future<KontaktItems> createKontakPost(
    String name, String email, String phone, String message) async {
  List<KontaktItems> items = [];
  final http.Response response = await http.post(
    Uri.parse('https://taxiforyou.ch/wp-json/theme/v1/contact_form'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'phone': phone,
      'message': message,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    var decode = jsonDecode(response.body);
    items = kontaktItemsFromJson(jsonEncode(decode["message"]));
    return KontaktItems.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed to create album.');
  }
}
