import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/feeding_form.dart';
import 'package:gymobile/src/pages/measures_page.dart';
import 'package:gymobile/src/pages/settings_page.dart';

import 'package:gymobile/src/pages/welcome_page.dart';
import 'package:gymobile/src/utils/enums.dart';


//import 'feeding_page.dart';
//import 'package:gymobile/src/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex=0;

  @override
  void initState() {
    super.initState();
    print("inicio");
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
            Navigator.pushNamed(context, SettingsPage.ROUTE);
          }, icon: Icon(Icons.settings),),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, WelcomePage.ROUTE);
          }, icon: Icon(Icons.person),),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, MeasuresPage.ROUTE);
          }, icon: Icon(Icons.assignment_ind_rounded),),
          
          
        
        ],
        elevation: 40,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.orange]
            )
          ),
        ),
        title: Text(_selectedIndex == 0? widget.titulo : menuOptions[_selectedIndex].label),
      ),
      body: Container(margin: EdgeInsets.symmetric(horizontal: 14.0), child: contentWidget[_selectedIndex]),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedingForm(),
                    ));
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value){
          _selectedIndex = value;
          setState(() {});
        },
        items: menuOptions.map((e) => 
          BottomNavigationBarItem(icon: Icon(e.icon), label: e.label)
      ).toList()),
      
    );
  }
}