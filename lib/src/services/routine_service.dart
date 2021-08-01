import 'dart:convert';
import 'package:gymobile/src/models/routine_model.dart';
import 'package:http/http.dart' as http;

class RoutineService{

  RoutineService();

  Future<List<Routine>> getRoutine() async{
    List<Routine> items = [];
    try{
      var uri = Uri.https("us-central1-mobilegym-c8921.cloudfunctions.net", "/api/app/routine/1/100");
      final resp = await http.get(uri);
      if(resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList){
        final routine = new Routine.fromJson(item);
        items.add(routine);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

  Future<dynamic> sendRoutine(Routine routine) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri =
          Uri.https("us-central1-mobilegym-c8921.cloudfunctions.net", "/api/api/routine");
      String routineJson = routineToJson(routine);
      final resp = await http.post(uri, headers: _headers, body: routineJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

}
