
import 'package:flutter/material.dart';
import '../header.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String headerTitle = 'ホーム';
  List _cardList = [];

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  // void _forwardListPage(argContext, argTitle) async {
  //   Navigator.push(
  //       argContext, MaterialPageRoute(builder: (context) => TalkPage(title: argTitle)));
  // }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Header(
            headerTitle: headerTitle,
            headerColor: Colors.green[500],
            headerTitleColor: Colors.white),
        body: Container());
  }
}
