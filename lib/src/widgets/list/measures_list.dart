import 'package:flutter/material.dart';
import 'package:gymobile/src/providers/measure_provider.dart';
import 'package:provider/provider.dart';


class MeasuresList extends StatefulWidget {
  MeasuresList({Key? key}) : super(key: key);

  @override
  _MeasuresListState createState() => _MeasuresListState();
}

class _MeasuresListState extends State<MeasuresList> {
  @override
  Widget build(BuildContext context) {
    final MeasProvider =
        Provider.of<MeasureProvider>(context, listen: false);
    MeasProvider.loadElements();

    return MeasProvider.elements.length == 0
        ? Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: MeasProvider.elements.length,
            itemBuilder: (_, index) => Card(
                child: ListTile(
                    leading: Icon(Icons.fitness_center_sharp),
                    title: Text("Peso"),
                    subtitle: Text(MeasProvider.elements[index].weight))));
  }
}