import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({Key? key, required this.img}) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        subtitle: Image.asset("../assets/images/us.png", width: 158, height: 158,),
      ),
    );
  }
}