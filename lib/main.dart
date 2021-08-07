import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/feeding_form.dart';
import 'package:gymobile/src/pages/home_page.dart';
import 'package:gymobile/src/pages/measures_page.dart';
import 'package:gymobile/src/pages/membership_page.dart';
import 'package:gymobile/src/pages/settings_page.dart';
import 'package:gymobile/src/pages/welcome_page.dart';
import 'package:gymobile/src/providers/app_provider.dart';
import 'package:gymobile/src/providers/measure_provider.dart';
import 'package:gymobile/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MeasureProvider>(
        create: (_) => MeasureProvider()),
        ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
  ], child: MyApp()));
}
  

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
        create: (BuildContext context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, provider, __) {
          getDarkMode().then((value) => provider.darkMode = value);
    
    return MaterialApp(
      title: 'GO_GYMOBILE',
      theme: ThemeData(
                brightness: provider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.lightBlue),
            home: HomePage(titulo: 'GO_GYMOBILE'),
            debugShowCheckedModeBanner: false,

      
      routes: {
        FeedingForm.ROUTE : (_) => FeedingForm(),
        WelcomePage.ROUTE: (_)=> WelcomePage(),
        MembershipPage.ROUTE: (_)=> MembershipPage(),
        MeasuresPage.ROUTE: (_)=> MeasuresPage(),
        SettingsPage.ROUTE: (_)=> SettingsPage()


      },
    );
  }));}
}