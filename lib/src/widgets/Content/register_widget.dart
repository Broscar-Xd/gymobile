import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/Cards/register_card.dart';

class RegisterWidget extends StatefulWidget {
  RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( child: Column(
         mainAxisSize: MainAxisSize.min,

         children: [
           RegisterCard(nameValue: "nameValue", lastnameValue: "lastnameValue", mailValue: "mailValue"),
           SizedBox(
             
            height: 40.0,
           ),
           Text("Más información en:", textAlign: TextAlign.left,)
           
         ],
      ),
    );
  }
}