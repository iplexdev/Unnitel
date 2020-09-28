import 'package:http/http.dart' as http;
import 'dart:convert';

// For login Api
Future loginUser(String email, String password) async {
  
  String url = 'https://af0a6ed4-f37d-465f-a735-6e1462312716.mock.pstmn.io/login?';
  final response = await http.post(
    url,
    headers: {"Accept": "Application/json"},
    body: {"email": email, "password": password}
    );
    if (response.statusCode == 200) {
    var convertDataToJson = jsonDecode(response.body);
    print('data-----$convertDataToJson');
    return convertDataToJson;
    } else {
      print("failed Response " + response.body);
    }
}