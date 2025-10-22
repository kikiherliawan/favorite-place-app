import 'package:favorite_place_app/view/widgets/place_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: PlaceList(places: []),
    );
  }
}
