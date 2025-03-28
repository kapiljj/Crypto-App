import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "https://api.fluttercrypto.agpro.co.in";
  static const String token =
      "eyJhbGciOiJIUzI1NilsInRScCI6IkpXVCJ9.eyJpZCl6lmQxYzFIYZUWLTU3NzQtNDIOMSO40TViLWYOMjBiZjRINDQ5ZClsInJvbGUiOmS1bGwsImFwcF9hY2NIc3MiOmZhbHNILCJhZG1pbI9hY2Nic3MiOmZhbHNILCJpYXQiOjESNDMwMTMZzOTIsImV4cCl6MTcOMzASOTcSMiwiaXNzljoiZGlyZWNOdXMifQ.2KrGkIkVA2R6rrdWKNfJscESocM_d2QsU8mOXWYJvZE";

  Future<Map<String, dynamic>> login(String email, String password) async {
    // Hardcoded admin credentials
    if (email == 'test@example.com' && password == 'password123') {
      return {'role': 'admin', 'token': 'admin-token'};
    }

    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Failed to login');
    }
  }

  Future<Map<String, dynamic>> signup(String email, String password) async {
    final url = Uri.parse('$baseUrl/auth/signup');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Failed to signup');
    }
  }
}
