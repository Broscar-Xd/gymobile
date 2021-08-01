// To parse this JSON data, do
//
//     final feeding = feedingFromJson(jsonString);

import 'dart:convert';

Feeding feedingFromJson(String str) => Feeding.fromJson(json.decode(str));

String feedingToJson(Feeding data) => json.encode(data.toJson());

class Feeding {
    Feeding({
        required this.food,
        required this.ingredients,
        required this.preparation,
        required this.calories,
    });

    String food;
    String ingredients;
    String preparation;
    String calories;
    Feeding.create(this.food, this.ingredients,this.preparation, this.calories);

    factory Feeding.fromJson(Map<String, dynamic> json) => Feeding(
        food: json["food"],
        ingredients: json["ingredients"],
        preparation: json["preparation"],
        calories: json["calories"],
    );

    Map<String, dynamic> toJson() => {
        "food": food,
        "ingredients": ingredients,
        "preparation": preparation,
        "calories": calories,
    };


}
