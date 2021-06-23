// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
    Client({
        required this.name,
        required this.surname,
        required this.idcard,
        required this.phone,
        required this.weight,
    });

    String name;
    String surname;
    String idcard;
    String phone;
    String weight;

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        name: json["name"],
        surname: json["surname"],
        idcard: json["idcard"],
        phone: json["phone"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "idcard": idcard,
        "phone": phone,
        "weight": weight,
    };
}
