import '../tabs/page001.dart';
import 'package:flutter/material.dart';

class TabMenu2 extends StatefulWidget {
  @override
  _TabMenu2 createState() => _TabMenu2();
}

class _TabMenu2 extends State<TabMenu2> {
  final String headerTitle = '検索';

  @override
  void initState() {
    super.initState();
    _load();
    setState(() {});
  }

  Future<void> _load() async {
    //_cardList = await MealsCardModel().createCardList('home_timeline');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[100],
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(deviceHeight * 0.1),
              // here the desired height
              child: AppBar(
                  title: Center(
                    child: Text(""),
                  ),
                  bottom: TabBar(
                      isScrollable: true,
                      tabs: choices.map((Choice choice) {
                        return Tab(
                          text: choice.title,
                          //icon: Icon(choice.icon),
                        );
                      }).toList(),
                    ),
                  )),
          body: SafeArea(
              child: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                //child: ChoiceCard(choice: choice),
                child: choice.page,
              );
            }).toList(),
          )),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.page});

  final String title;
  final IconData icon;
  final StatefulWidget page;
}

List<Choice> choices = <Choice>[
  Choice(title: 'お菓子', icon: Icons.directions_car, page: Page001()),
  Choice(title: '食事', icon: Icons.directions_bike, page: Page001()),
  Choice(title: 'この場所', icon: Icons.directions_boat, page: Page001()),
];
