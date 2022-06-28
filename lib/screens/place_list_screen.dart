import 'package:flutter/material.dart';
import '../provider/great_places.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Consumer<GreatPlaces>(
          child: const Center(
            child: Text('Got no places yet, start adding!'),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch!
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                        backgroundImage: FileImage(greatPlaces.items[i].image)),
                        title: Text(greatPlaces.items[i].title,),
                        onTap: (){
                        // Go to Page
                        },
                  ),
                )),
    );
  }
}
