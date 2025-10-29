import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';

import '../models/place.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []);

  void addPLace(String title, File image) {
    final newPlace = Place(title: title, image: image);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider = StateNotifierProvider((ref) {
  return UserPlaceNotifier();
});
