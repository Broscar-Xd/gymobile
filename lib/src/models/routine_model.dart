// To parse this JSON data, do
//
//     final routine = routineFromJson(jsonString);

import 'dart:convert';

Routine routineFromJson(String str) => Routine.fromJson(json.decode(str));

String routineToJson(Routine data) => json.encode(data.toJson());

class Routine {
    Routine({
        required this.type,
        required this.name,
        required this.series,
        required this.repetitions,
    });

    String type;
    String name;
    String series;
    String repetitions;

    factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        type: json["type"],
        name: json["name"],
        series: json["series"],
        repetitions: json["repetitions"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "series": series,
        "repetitions": repetitions,
    };
}
