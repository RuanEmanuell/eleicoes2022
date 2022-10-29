import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../controller/controller.dart';

import "../widgets/desktop.dart";
import "../widgets/smartphone.dart";

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var percentage;

  @override
  void initState() {
    super.initState();
    Provider.of<Controller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(body: screenWidth > 500 ? DesktopWidget() : SmartphoneWidget());
  }
}
