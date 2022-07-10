import 'package:flutter/material.dart';
import 'package:world_travel/screens/add_places_screen.dart';
import '../screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Travel',
      home: const PlacesScreen(),
      routes: {
        AddScreen.routeName: (ctx) => const AddScreen(),
      },
    );
  }
}
