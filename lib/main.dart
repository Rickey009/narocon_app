import 'package:flutter/material.dart';
import 'footer.dart';
import 'page/top.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[50],
        ),
        debugShowCheckedModeBanner: false,
        home: TopPage()
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[100],
      ),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: RootWidget(),
        ),
      ),
    );
  }
}