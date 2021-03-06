import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/Cards/welcome_card.dart';
import 'package:table_calendar/table_calendar.dart';

class WelcomeWidget extends StatefulWidget {
  static const String ROUTE = "welcome";
  WelcomeWidget({Key? key}) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    //double _heigth = MediaQuery.of(context).size.height;8

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WelcomeCard(img: "pp"),
          Container(
            child: SingleChildScrollView(
          child: Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(10.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  headerStyle: HeaderStyle(decoration: BoxDecoration(
                    color: Color.lerp(Colors.green, Colors.greenAccent, 0.5)
                  )),
                ),
                
              )
              
            ],
          )),
        )),
          SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
