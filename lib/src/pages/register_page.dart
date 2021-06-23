import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _FormRegister(),
      ),
    );
  }
}

class _FormRegister extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Form(child: Column(children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: "Nombre",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Apellido",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Correo",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Contraseña",
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))
          ),
        ),
        SizedBox(height: 20,),
        RaisedButton(child: Text("Guarddar"), onPressed: (){
          print("Guardar");
        })
      ],),),
    );
  }
}