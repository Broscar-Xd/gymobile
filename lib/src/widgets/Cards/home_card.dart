import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  
  const HomeCard({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Image.asset("../assets/images/"+img+".jpg"),
      ),
    );
  }
}