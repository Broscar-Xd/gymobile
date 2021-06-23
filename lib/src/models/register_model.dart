// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    Register({
        required this.name,
        required this.surname,
        required this.mail,
        required this.password,
    });

    String name;
    String surname;
    String mail;
    String password;

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        name: json["name"],
        surname: json["surname"],
        mail: json["mail"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "mail": mail,
        "password": password,
    };
}
