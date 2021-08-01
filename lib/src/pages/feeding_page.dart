import 'package:flutter/material.dart';
import 'package:gymobile/src/models/feeding_model.dart';
import 'package:gymobile/src/pages/feeding_form.dart';
import 'package:gymobile/src/utils/standard_widgets.dart';


class FeedingPage extends StatelessWidget {
  const FeedingPage({Key? key, required this.feeding}) : super(key: key);
  final Feeding feeding;
  static const String ROUTE = "feeding";

  @override
  Widget build(BuildContext context) {
   
      FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FeedingForm.ROUTE);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange,
      );
      
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        elevation: 40,
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.refresh),),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, FeedingForm.ROUTE);
          }, icon: Icon(Icons.add),)
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.orange]
            )
          ),
        ),
        title: Text("Alimentación"),
      ),
        body: CustomScrollView(
          slivers: [
            _appBar(context),
            SliverFillRemaining(child: FeedingForm())
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
          ],
        )));

        
  }
  
}