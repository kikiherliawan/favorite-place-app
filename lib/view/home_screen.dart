import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/user_place.dart';
import 'add_place_screen.dart';
import 'widgets/place_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => AddPlaceScreen()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlaceList(places: userPlaces),
    );
  }
}
