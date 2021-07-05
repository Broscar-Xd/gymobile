import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/Content/feeding_widget.dart';

//import 'package:gymobile/db/op.dart';
//import 'package:sqflite/sqflite.dart';

class FeedingPage extends StatefulWidget {
  
  static const String ROUTE = "feeding";

  @override
  _FeedingPageState createState() => _FeedingPageState();
}

class _FeedingPageState extends State<FeedingPage> {
  
  
  @override
  Widget build(BuildContext context){

     //Gymbase.feedings();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Alimentaciòn"),
      ),
      body: Container(
      child: SingleChildScrollView(child: Card(
        
        child: FeddingWidget()),) 
    ));  
      
    
  }
}