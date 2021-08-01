import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/Content/feeding_widget.dart';
import 'package:gymobile/src/widgets/Content/home_widget.dart';
import 'package:gymobile/src/widgets/Content/routine_widget.dart';


class ItemMenu{
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);

}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home_filled, "Home"),
  ItemMenu(Icons.restaurant_menu,"Alimentación"),
  ItemMenu.create(Icons.fitness_center_outlined, "Rutinas"),
  
];

List<Widget> contentWidget = [
  HomeWidget(), FeedingWidget(), RoutineWidget()
];