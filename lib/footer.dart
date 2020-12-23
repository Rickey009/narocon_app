import 'package:flutter/material.dart';

import 'routes/home.dart';
import 'routes/tabmenu.dart';

import 'routes/tabmenu2.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidget createState() => _RootWidget();
}

class _RootWidget extends State<RootWidget> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  // アイコン情報
  final Map _rootWidgetIcons = {
    'ホーム' : {'icon': Icons.home, 'route': Home()},
    '読みもの' : {'icon': Icons.menu_book, 'route': TabMenu()},
    '探す' : {'icon': Icons.search, 'route': TabMenu2()},
    'レシピ動画' : {'icon': Icons.play_arrow, 'route': Home()},
    '調べる' : {'icon': Icons.plagiarism_outlined, 'route': Home()},
  };

  // アイコン順番
  final List _footerItemOrder = [
    'ホーム',
    '読みもの',
    '探す',
    'レシピ動画',
    '調べる',
  ];

  @override
  void initState() {
    super.initState();
    for ( var i = 0; i < _footerItemOrder.length; i++) {
      _bottomNavigationBarItems.add(_createIcon(_footerItemOrder[i]));
    }
  }

  // アイコンを作成する
  BottomNavigationBarItem _createIcon(String key) {
    return BottomNavigationBarItem(
      icon: Icon(_rootWidgetIcons[key]['icon']),
      title: Text(key),
    );
  }

  void _onItemTapped(int index) {
    setState( () {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[100],
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body : _rootWidgetIcons[_footerItemOrder.asMap()[_selectedIndex]]['route'],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: _bottomNavigationBarItems,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black45,
          ),
      )
    );
  }
}