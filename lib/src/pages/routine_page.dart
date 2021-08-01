import 'package:flutter/material.dart';
import 'package:gymobile/src/models/routine_model.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';


class RoutinePage extends StatelessWidget {
  const RoutinePage({Key? key, required this.routine}) : super(key: key);
  final Routine routine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        elevation: 40,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.orange]
            )
          ),
        ),
        title: Text("Rutinas"),
      ),
        body: CustomScrollView(
          slivers: [
            _appBar(context),
          ],
        ));
  }

  _appBar(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        expandedHeight: 210.0,
        flexibleSpace: FlexibleSpaceBar(
            background: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Standard.getBackground(context),
            Container(
              child: Column(children: [
                SizedBox(height: 35.0),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Theme.of(context).canvasColor),
                      child: Text(routine.photo),
                ),
                Standard.titleToForm(context, routine.name)
              ]),
            ),
          ],
        )));
  }
}