import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MembershipPage extends StatelessWidget {
  static const String ROUTE = "Membership";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Membresia"),
        ),
        body: Container(
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
        )));
  }
}
