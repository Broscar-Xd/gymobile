import 'package:flutter/material.dart';
import 'package:gymobile/src/models/routine_model.dart';
import 'package:gymobile/src/pages/routine_page.dart';


class RoutineCard extends StatelessWidget {
  const RoutineCard({Key? key, required this.currentRoutine}) : super(key: key);
  final Routine currentRoutine;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoutinePage(routine: currentRoutine),
                ));
          },
          title: Text(currentRoutine.type,
              style: Theme.of(context).textTheme.bodyText1),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(currentRoutine.name,
                style: Theme.of(context).textTheme.caption),
          ),
          leading:  ClipOval(
              // ignore: unnecessary_null_comparison
              child: currentRoutine.photo == null
                  ? Image.asset("assets/images/user.png")
                  : Image.network(currentRoutine.photo.toString())),
        ));
  }
}