// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.mail,
        required this.password,
    });

    String mail;
    String password;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        mail: json["mail"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "mail": mail,
        "password": password,
    };
}
