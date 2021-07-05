import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/welcome_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _FormLogin(),
      ),
    );
  }
}

class _FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(100),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Correo",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text("Aceptar"),
                color: Colors.black26,
                elevation: 20,
                splashColor: Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                padding: EdgeInsets.all(30),
                onPressed: () {
                  Navigator.pushNamed(context, WelcomePage.ROUTE);
                })
          ],
        ),
      ),
    );
  }
}
