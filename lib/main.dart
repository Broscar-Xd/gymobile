import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/feeding_form.dart';
import 'package:gymobile/src/pages/home_page.dart';
import 'package:gymobile/src/pages/membership_page.dart';
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
      title: 'GO_GYMOBILE',
      theme: ThemeData(primaryColor: Colors.black),
      home:  HomePage(titulo:'GO_GYMOBILE'),
      debugShowCheckedModeBanner: false,

      
      routes: {
        FeedingForm.ROUTE : (_) => FeedingForm(),
        WelcomePage.ROUTE: (_)=> WelcomePage(),
        MembershipPage.ROUTE: (_)=> MembershipPage()


      },
    );
  }
}

