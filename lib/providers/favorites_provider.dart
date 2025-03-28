import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/crypto.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Crypto>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<Crypto>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(Crypto crypto) {
    if (state.contains(crypto)) {
      state = state.where((item) => item.id != crypto.id).toList();
    } else {
      state = [...state, crypto];
    }
  }
}
