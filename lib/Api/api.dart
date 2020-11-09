import 'package:http/http.dart' as http;
import 'dart:convert';

// For login Api Post Request
Future loginUser(String email, String password) async {
  
  String url = 'https://af0a6ed4-f37d-465f-a735-6e1462312716.mock.pstmn.io/login?';
  final response = await http.post(
    url,
    headers: {"Accept": "Application/json"},
    body: {"email": email, "password": password}
    );
    if (response.statusCode == 200) {
    var convertDataToJson = jsonDecode(response.body);
    return convertDataToJson;
    } else {
      print("failed Response " + response.body);
    }
}
// For GET Request 
Future<List<dynamic>> getData() async {
  final res = await http.get('https://af0a6ed4-f37d-465f-a735-6e1462312716.mock.pstmn.io/login?');
  if (res.statusCode == 200) {
    Map<String, dynamic> map = jsonDecode(res.body);
    List<dynamic> data = map["devices"];
    return data;
  } else {
    throw Exception('Failed to load Data');
  }
}