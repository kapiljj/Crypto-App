import 'dart:convert';
import 'package:http/http.dart' as http;

class FavoriteService {
  final String baseUrl = "https://api.fluttercrypto.agpro.co.in";

  // Save a favorite cryptocurrency to Directus
  Future<void> saveFavorite(String token, Map<String, dynamic> favorite) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items/crypto_favorites'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(favorite),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Favorite saved successfully!");
    } else {
      print("Save Favorite Failed: ${response.body}");
      throw Exception("Failed to save favorite: ${response.body}");
    }
  }
}
