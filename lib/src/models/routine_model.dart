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
        required this.photo,
        required this.repetitions,
        required this.link,

    });

    String type;
    String name;
    String series;
    String photo;
    String repetitions;
    String link;

    factory Routine.fromJson(Map<String, dynamic> json) => Routine(
        type: json["type"],
        name: json["name"],
        series: json["series"],
        photo: json["photo"],
        repetitions: json["repetitions"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "series": series,
        "photo": photo,
        "repetitions": repetitions,
        "link": link,
    };
}
