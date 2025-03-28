import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/crypto.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final crypto = favorites[index];
          return ListTile(
            leading: Image.network(crypto.image, width: 40, height: 40),
            title: Text(crypto.name),
            subtitle: Text(crypto.symbol.toUpperCase()),
            trailing: Text('\$${crypto.currentPrice.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
