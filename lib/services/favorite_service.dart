import 'dart:convert';
import 'package:http/http.dart' as http;

class FavoriteService {
  final String token;

  FavoriteService(this.token);

  Future<void> saveFavorite(Map<String, dynamic> favorite) async {
    final url = Uri.parse('https://api.fluttercrypto.agpro.co.in/items/crypto_favorites');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(favorite),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save favorite: ${response.body}');
    }
  }

  Future<List<dynamic>> getFavorites() async {
    final url = Uri.parse('https://api.fluttercrypto.agpro.co.in/items/crypto_favorites');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to fetch favorites: ${response.body}');
    }
  }
}
