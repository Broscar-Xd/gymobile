// To parse this JSON data, do
//
//     final membership = membershipFromJson(jsonString);

import 'dart:convert';

Membership membershipFromJson(String str) => Membership.fromJson(json.decode(str));

String membershipToJson(Membership data) => json.encode(data.toJson());

class Membership {
    Membership({
        required this.type,
        required this.startdate,
        required this.enddate,
    });

    String type;
    DateTime startdate;
    DateTime enddate;

    factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        type: json["type"],
        startdate: DateTime.parse(json["startdate"]),
        enddate: DateTime.parse(json["enddate"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "startdate": "${startdate.year.toString().padLeft(4, '0')}-${startdate.month.toString().padLeft(2, '0')}-${startdate.day.toString().padLeft(2, '0')}",
        "enddate": "${enddate.year.toString().padLeft(4, '0')}-${enddate.month.toString().padLeft(2, '0')}-${enddate.day.toString().padLeft(2, '0')}",
    };
}
