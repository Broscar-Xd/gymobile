import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/feeding_page.dart';
import 'package:gymobile/src/widgets/Cards/welcome_card.dart';

class WelcomeWidget extends StatefulWidget {
  static const String ROUTE = "welcome";
  WelcomeWidget({Key? key}) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    //double _heigth = MediaQuery.of(context).size.height;8

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WelcomeCard(img: "pp"),
          Center(
            child: RaisedButton(
                color: Colors.green,
                padding: EdgeInsets.all(30),
                elevation: 20,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: Text("Membresia"),
                onPressed: () {
                  print("Membresia");
                }),
          ),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: RaisedButton(
                color: Colors.lightBlue,
                padding: EdgeInsets.all(30),
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                splashColor: Colors.red,
                child: Text("Rutinas"),
                onPressed: () {
                  print("Rutinas");
                }),
          ),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: RaisedButton(
                child: Text("Alimentación"),
                color: Colors.lightGreen,
                elevation: 20,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                padding: EdgeInsets.all(30),
                onPressed: () {
                  Navigator.pushNamed(context, FeedingPage.ROUTE);
                }),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
