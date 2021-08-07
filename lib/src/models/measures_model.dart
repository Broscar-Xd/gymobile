// To parse this JSON data, do
//
//     final measures = measuresFromJson(jsonString);

import 'dart:convert';

Measures measuresFromJson(String str) => Measures.fromJson(json.decode(str));

String measuresToJson(Measures data) => json.encode(data.toJson());

class Measures {
    Measures({
        this.id,
       required this.weight,
       required this.chest,
       required this.arm,
       required this.shoulders,
       required this.leg,
       required this.calf,
    });

    int? id;
    String weight;
    String chest;
    String arm;
    String shoulders;
    String leg;
    String calf;

    factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        id: json["id"],
        weight: json["weight"],
        chest: json["chest"],
        arm: json["arm"],
        shoulders: json["shoulders"],
        leg: json["leg"],
        calf: json["calf"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "chest": chest,
        "arm": arm,
        "shoulders": shoulders,
        "leg": leg,
        "calf": calf,
    };

    Measures.create(this.weight, this.chest, this.arm, this.shoulders, this.leg, this.calf);

}
