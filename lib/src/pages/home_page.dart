import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/routine_page.dart';
import 'package:gymobile/src/utils/enums.dart';
import 'package:gymobile/src/widgets/Content/feeding_widget.dart';

import 'feeding_page.dart';

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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.fitness_center_sharp), onPressed: (){
        Navigator.pushNamed(context, FeedingPage.ROUTE);
      }),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_selectedIndex == 0? widget.titulo : menuOptions[_selectedIndex].label),
      ),
      body: Container(margin: EdgeInsets.symmetric(horizontal: 14.0), child: contentWidget[_selectedIndex]),
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