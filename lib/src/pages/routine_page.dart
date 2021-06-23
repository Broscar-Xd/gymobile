//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoutinePage extends StatelessWidget {
  
  static const String ROUTE = "routine";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("routine").snapshots(),
        builder: (context, snapshot){
          
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
              );
          }

          List<DocumentSnapshot> docs = snapshot.data.docs; 

          return Container(
            child: 
            ListView.builder(itemCount: docs.length, 
              itemBuilder: (_, i){

                Map<String, dynamic> data = docs[i].data();
                print("----");
                print(data);

                return ListTile(title: Text("AA"),);

          },),);
          
        },
        ),*/
    );
  }
}