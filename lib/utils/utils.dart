import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/crypto.dart';

Future<List<Crypto>> loadCryptoData() async {
  final String response = await rootBundle.loadString('assets/crypto_data.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Crypto.fromJson(json)).toList();
}
