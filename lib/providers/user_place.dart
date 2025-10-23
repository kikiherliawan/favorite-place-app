import 'package:flutter_riverpod/legacy.dart';

import '../models/place.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);

  void addPLace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider = StateNotifierProvider((ref) {
  return UserPlaceNotifier();
});
