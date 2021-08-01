import 'package:flutter/material.dart';
import 'package:gymobile/src/models/routine_model.dart';
import 'package:gymobile/src/services/routine_service.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';
import 'package:gymobile/src/widgets/Cards/routine_card.dart';


class RoutineList extends StatefulWidget {
  const RoutineList({Key? key}) : super(key: key);

  @override
  _RoutineListState createState() => _RoutineListState();
}

class _RoutineListState extends State<RoutineList> {
  final RoutineService _service = RoutineService();
  // ignore: avoid_init_to_null
  List<Routine>? _routine = null;

  @override
  void initState() {
    super.initState();
    _loadRoutine();
  }

  @override
  Widget build(BuildContext context) {
    return _routine == null
        ? Standard.getBoard(context, "Descargando", Icons.download)
        : _routine!.length == 0
            ? Standard.getBoard(
                context, "No hay datos", Icons.no_accounts)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _routine!
                        .map((e) => RoutineCard(currentRoutine: e))
                        .toList()),
              );
  }

  _loadRoutine() {
    _service.getRoutine().then((value) {
      _routine = value;
      setState(() {});
    });
  }
}