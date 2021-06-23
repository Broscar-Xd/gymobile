import 'dart:convert';

import 'package:gymobile/src/models/feeding_model.dart';
import 'package:http/http.dart' as http;

class FeedingService{

  FeedingService();

  Future<List<Feeding>> getFeeding() async{
    List<Feeding> items = [];
    try{
      var uri = Uri.https("us-central1-mobilegym-c8921.cloudfunctions.net", "/api/app/feeding/1/100");
      final resp = await http.get(uri);
      if(resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList){
        final feeding = new Feeding.fromJson(item);
        items.add(feeding);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

}