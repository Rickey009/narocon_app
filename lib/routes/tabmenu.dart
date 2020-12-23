import '../tabs/page001.dart';
import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  @override
  _TabMenu createState() => _TabMenu();
}

class _TabMenu extends State<TabMenu> {
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
                  bottom: ColoredTabBar(
                    color: Colors.blue[200],
                    tabBar: TabBar(
                      isScrollable: true,
                      tabs: choices.map((Choice choice) {
                        return Tab(
                          text: choice.title,
                          icon: Icon(choice.icon),
                        );
                      }).toList(),
                    ),
                  ))),
          body: SafeArea(
              child: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
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
  Choice(title: '0001', icon: Icons.directions_car, page: Page001()),
  Choice(title: '0002', icon: Icons.directions_bike, page: Page001()),
  Choice(title: '0003', icon: Icons.directions_boat, page: Page001()),
  Choice(title: '0004', icon: Icons.directions_car, page: Page001()),
  Choice(title: '0005', icon: Icons.directions_bike, page: Page001()),
  Choice(title: '0006', icon: Icons.directions_car, page: Page001()),
  Choice(title: '0007', icon: Icons.directions_bike, page: Page001()),
  Choice(title: '0008', icon: Icons.directions_boat, page: Page001()),
  Choice(title: '0009', icon: Icons.directions_car, page: Page001()),
  Choice(title: '0010', icon: Icons.directions_bike, page: Page001()),
];

class ColoredTabBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget tabBar;
  final Color color;

  ColoredTabBar({@required this.tabBar, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: color,
      child: tabBar,
    );
  }

  @override
  Size get preferredSize => tabBar.preferredSize;
}
