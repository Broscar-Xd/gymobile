import 'package:flutter/material.dart';
import 'package:gymobile/src/pages/login_page.dart';
import 'package:gymobile/src/pages/register_page.dart';
import 'package:gymobile/src/widgets/Content/home_widget.dart';
//import 'package:gymobile/src/widgets/Content/login_widget.dart';
//import 'package:gymobile/src/widgets/Content/register_widget.dart';
/*import 'package:gymobile/src/widgets/client_widget.dart';
import 'package:gymobile/src/widgets/feeding_widget.dart';
import 'package:gymobile/src/widgets/home_widget.dart';
import 'package:gymobile/src/widgets/membership_widget.dart';
import 'package:gymobile/src/widgets/routine_widget.dart';*/

class ItemMenu{
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);

}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.fitness_center_outlined, "Home"),
  ItemMenu(Icons.app_registration, "Registrate"),
  ItemMenu.create(Icons.login, "Login"),
];

List<Widget> contentWidget = [
  HomeWidget(), RegisterPage(), LoginPage()
];