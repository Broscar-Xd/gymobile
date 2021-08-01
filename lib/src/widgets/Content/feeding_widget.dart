  
import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/list/feeding_list.dart';


class FeedingWidget extends StatefulWidget {
  const FeedingWidget({Key? key}) : super(key: key);

  @override
  _FeedingWidgetState createState() => _FeedingWidgetState();
}

class _FeedingWidgetState extends State<FeedingWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: FeedingList());
  }
}