import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
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

  Future<dynamic> sendFeeding(Feeding feeding) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri =
          Uri.https("us-central1-mobilegym-c8921.cloudfunctions.net", "/api/api/feeding");
      String feedingJson = feedingToJson(feeding);
      final resp = await http.post(uri, headers: _headers, body: feedingJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }
  Future<String> uploadImage(File image) async {
    final cloudinary = CloudinaryPublic('dzygpkghm', 'xmax0xkg', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      return "";
    }
  }

}

