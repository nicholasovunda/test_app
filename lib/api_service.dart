import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://reqres.in";

  static Future<dynamic> getUsers() async {
    var response = await http.get(Uri.parse("$baseUrl/api/users?page=2"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<dynamic> postUser() async {
    var response = await http.post(
      Uri.parse("$baseUrl/api/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': 'John Doe',
        'job': 'Software Developer',
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user');
    }
  }
}
