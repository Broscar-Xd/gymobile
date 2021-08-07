import 'package:flutter/material.dart';
import 'package:gymobile/src/widgets/Content/measures_form.dart';
import 'package:gymobile/src/widgets/list/measures_list.dart';


class MeasuresPage extends StatefulWidget {
  const MeasuresPage({Key? key}) : super(key: key);
  static const String ROUTE = "measu";

  @override
  _MeasuresPageState createState() => _MeasuresPageState();
}

class _MeasuresPageState extends State<MeasuresPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Formulario'),
    Tab(text: 'Listado'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [MeasuresForm(), MeasuresList()],
      ),
    );
  }
}