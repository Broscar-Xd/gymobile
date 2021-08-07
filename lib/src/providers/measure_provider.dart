import 'package:flutter/material.dart';
import 'package:gymobile/src/models/measures_model.dart';
import 'dbprovider.dart';

class MeasureProvider extends ChangeNotifier {
  List<Measures> elements = [];

  Future<Measures> addElement(String weight, String chest, String arm, String shoulders, String leg, String calf) async {
    Measures element = Measures(weight: weight, chest: chest, arm: arm, shoulders: shoulders, leg: leg, calf: calf );
    final id = await DBProvider.db.insert(element);
    element.id = id;
    this.elements.add(element);
    notifyListeners();
    return element;
  }

  loadElements() async {
    final travelsQuery = await DBProvider.db.list();
    this.elements = [...travelsQuery];
    notifyListeners();
  }
}