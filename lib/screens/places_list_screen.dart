import 'package:flutter/material.dart';
import 'package:world_travel/providers/great_places.dart';
import '../screens/add_places_screen.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddScreen.routeName,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Text('No places added yet, start adding some places'),
        builder: (ctx, greatPlaces, ch) => ListView.builder(
          itemBuilder: (ctx, i) => ListTile(
            leading: CircleAvatar(
              child: Image.file(greatPlaces.items[i].image),
            ),
            title: Text(greatPlaces.items[i].title),
          ),
          itemCount: greatPlaces.items.length,
        ),
      ),
    );
  }
}
