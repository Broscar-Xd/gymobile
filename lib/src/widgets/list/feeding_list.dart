import 'package:flutter/material.dart';
import 'package:gymobile/src/models/feeding_model.dart';
import 'package:gymobile/src/services/feeding_service.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';
import 'package:gymobile/src/widgets/Cards/feeding_card.dart';


class FeedingList extends StatefulWidget {
  const FeedingList({Key? key}) : super(key: key);

  @override
  _FeedingListState createState() => _FeedingListState();
}

class _FeedingListState extends State<FeedingList> {
  final FeedingService _service = FeedingService();
  // ignore: avoid_init_to_null
  List<Feeding>? _feeding = null;

  @override
  void initState() {
    super.initState();
    _loadFeeding();
  }

  @override
  Widget build(BuildContext context) {
    return _feeding == null
        ? Standard.getBoard(context, "Descargando", Icons.download)
        : _feeding!.length == 0
            ? Standard.getBoard(
                context, "No hay datos", Icons.no_accounts)
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _feeding!
                        .map((e) => FeedingCard(currentFeeding: e))
                        .toList()),
              );
  }

  _loadFeeding() {
    _service.getFeeding().then((value) {
      _feeding = value;
      setState(() {});
    });
  }
}