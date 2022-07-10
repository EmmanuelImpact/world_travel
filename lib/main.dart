import 'package:flutter/material.dart';
import 'package:world_travel/providers/great_places.dart';
import 'package:world_travel/screens/add_places_screen.dart';
import '../screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'World Travel',
        home: const PlacesScreen(),
        routes: {
          AddScreen.routeName: (ctx) => const AddScreen(),
        },
      ),
    );
  }
}
