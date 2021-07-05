import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/feeding_page.dart';
import 'package:gymobile/src/pages/home_page.dart';
import 'package:gymobile/src/pages/welcome_page.dart';
void main() {//async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  
  runApp(MyApp());
}
  

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'GYMOBILE',
      theme: ThemeData(primaryColor: Colors.black),
      home:  HomePage(titulo:'GYMOBILE'),

      
      routes: {
        FeedingPage.ROUTE : (_) => FeedingPage(),
        WelcomePage.ROUTE: (_)=> WelcomePage()

      },
    );
  }
}

