import 'package:flutter/material.dart';

class MembershipWidget extends StatefulWidget {
  MembershipWidget({Key? key}) : super(key: key);

  @override
  _MembershipWidgetState createState() => _MembershipWidgetState();
}

class _MembershipWidgetState extends State<MembershipWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(child: Text("Membership"),),
    );
  }
}