import 'package:flutter/material.dart';
import 'ExoplanetsPage.dart' as exoplanets;
import 'ActivitiesPage.dart' as activities;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Softnauts Project"),
            centerTitle: true,
            bottom: new TabBar(controller: controller, tabs: <Tab>[
              new Tab(text: "Exoplanets"),
              new Tab(text: "Activity")
            ])),
        body: new TabBarView(controller: controller,
            children: <Widget>[
              new exoplanets.ExoplanetsPage(),
              new activities.ActivitiesPage()
            ]));
  }
}
