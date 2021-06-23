//import 'package:gymobile/src/models/feeding_model.dart';
import 'package:gymobile/src/models/feeding_model2.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Gymbase{
  static Future<Database> _openDB() async{
    return openDatabase(
      join(await getDatabasesPath(),"gymobile.db"), onCreate: (db,version){
        return db.execute("CREATE TABLE feedings (id INTERGER PRIMARY KEY, food TEXT, ingredients TEXT, preparation TEXT, calories TEXT)");
      }, version: 1
    );
  }

  static Future insert(Feeding feeding) async {

    Database database = await _openDB();

    return database.insert("feedings", feeding.toMap());

  }

  static Future<List<Feeding>> feedings() async{
    Database database = await _openDB();

    final List<Map<String, dynamic>> fm = await database.query("feedings");
  
    for (var n in fm)
    {
      print("___"+n['food']);
    }
    
    return List.generate(fm.length, (i) => Feeding(id: fm[i]['id'],food: fm[i]['food'], ingredients: fm[i]['ingredients'], preparation: fm[i]['preparation'], calories: fm[i]['calories']));
  }
}