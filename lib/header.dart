
import 'package:flutter/material.dart';
import 'page/FreeWordSearchPage.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String headerTitle;
  final Color headerColor;
  final Color headerTitleColor;

  Header({this.headerTitle, this.headerColor, this.headerTitleColor});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {

    void _forwardFreeWordSearchPage() async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FreeWordSearchPage(),
          ));
    }

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        //child: UserIcon(iconColor: headerTitleColor),
        child:CircleAvatar(child: Icon(Icons.account_circle),)
      ),
      title: Center(
        child: Text(headerTitle,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: headerTitleColor)),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.settings,color: headerTitleColor,),
            onPressed: _forwardFreeWordSearchPage,
          ),
        ),
      ],
      backgroundColor: headerColor,
    );
  }
}
