import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoListScreen extends StatelessWidget {
  final String token;

  const CryptoListScreen({Key? key, required this.token}) : super(key: key);

  Future<List<dynamic>> fetchCryptos() async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch cryptos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchCryptos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(data[index]['image'], width: 40),
                  title: Text(data[index]['name']),
                  subtitle: Text(
                    'Price: \$${data[index]['current_price'].toString()}',
                  ),
                  trailing: Text(
                    'Rank: ${data[index]['market_cap_rank'].toString()}',
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
