import 'package:flutter/material.dart';
import 'package:gymobile/src/models/feeding_model.dart';
import 'package:gymobile/src/pages/feeding_page.dart';


class FeedingCard extends StatelessWidget {
  const FeedingCard({Key? key, required this.currentFeeding}) : super(key: key);
  final Feeding currentFeeding;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedingPage(feeding: currentFeeding),
                ));
          },
          title: Text(currentFeeding.ingredients,
              style: Theme.of(context).textTheme.bodyText1),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(currentFeeding.preparation,
                style: Theme.of(context).textTheme.caption),
          ),
          leading:  ClipOval(
              // ignore: unnecessary_null_comparison
              child: currentFeeding.photo == null
                  ? Image.asset("assets/images/food.jpg")
                  : Image.network(currentFeeding.photo.toString())),
        ));
  }
}