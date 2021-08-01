  
import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/list/routine_list.dart';


class RoutineWidget extends StatefulWidget {
  const RoutineWidget({Key? key}) : super(key: key);

  @override
  _RoutineWidgetState createState() => _RoutineWidgetState();
}

class _RoutineWidgetState extends State<RoutineWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: RoutineList());
  }
}