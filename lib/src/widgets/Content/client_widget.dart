import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientWidget extends StatefulWidget {
  ClientWidget({Key? key}) : super(key: key);

  @override
  _ClientWidgetState createState() => _ClientWidgetState();
}

class _ClientWidgetState extends State<ClientWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Text("Welcome"),),
    );
  }
}