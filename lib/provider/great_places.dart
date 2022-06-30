import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../model/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: pickedImage,
        location:
            PlaceLocation(latitude: 2.333, longitude: 5.222, address: ''));
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

    Future<void> fetchAndSetPlaces() async {
      final dataList = await DBHelper.getData('user_places');
      _items = dataList
          .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: PlaceLocation(latitude: 2.11, longitude: 5.11)))
          .toList();
      notifyListeners();
    }
  }

