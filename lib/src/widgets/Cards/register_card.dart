import 'package:flutter/material.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({Key? key, required this.nameValue, required this.lastnameValue, required this.mailValue}) : super(key: key);

  final String nameValue;
  final String lastnameValue;
  final String mailValue;

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Nombre:"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Apellido:"),
            ),

            RaisedButton(child: Text(""),
            color: Colors.lightGreen,
                elevation: 20,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                padding: EdgeInsets.all(30),
            onPressed: (){
              
            },
            )
          ],
        ),)),
    )
    
    );
  }
}