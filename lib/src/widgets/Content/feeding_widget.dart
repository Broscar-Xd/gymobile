import 'package:flutter/material.dart';
import 'package:gymobile/src/models/feeding_model.dart';
import 'package:gymobile/src/services/feeding_service.dart';

class FeddingWidget extends StatefulWidget {
  FeddingWidget({Key? key}) : super(key: key);
  static const String ROUTE = "fedding";
  @override
  _FeddingWidgetState createState() => _FeddingWidgetState();
}

class _FeddingWidgetState extends State<FeddingWidget> {
  
  FeedingService  _service = FeedingService();
  List<Feeding> _feeding = [];
  @override
  void initState() {
    
    super.initState();
    _loadFeeding(); 
  }

  @override
  Widget build(BuildContext context) {
    return  _feeding.length == 0 ? Container(
      child: Center(child:  CircularProgressIndicator()),
    ):
    Column(
       mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.center,
      children: _feeding.map((e) => ListTile(title: Text(e.ingredients), subtitle: Text(e.preparation), leading: Text(e.food))).toList()
    );
  }

  _loadFeeding(){
    _service.getFeeding().then((value){ 
      _feeding = value;
      setState(() {
        
      });
      });
  }
}