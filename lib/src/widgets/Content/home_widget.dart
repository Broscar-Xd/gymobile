import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/Cards/home_card.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {

    double _heigth = MediaQuery.of(context).size.height;


    return SingleChildScrollView( child: Column(
         mainAxisSize: MainAxisSize.min,

         children: [
           HomeCard(img: "pp"),
           SizedBox(
             height: _heigth*0.3,
             child: Container(color: Colors.black,),
           ),
           SizedBox(
             
            height: 40.0,
           ),
           Text("Más información en:", textAlign: TextAlign.left,),
           Image.asset('../assets/images/fb.png', width: 18, height: 18)
           
         ],
      ),
    );
  }
}