import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/feeding_page.dart';
import 'package:gymobile/src/widgets/Content/welcome_widget.dart';

class WelcomePage extends StatefulWidget {

  static const String ROUTE = "welcome";
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.fitness_center_sharp), onPressed: (){
        Navigator.pushNamed(context, FeedingPage.ROUTE);
      }),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome"),
      ),
      body: Container(margin: EdgeInsets.symmetric(horizontal: 14.0), child: WelcomeWidget()),
      
    );
  }
}