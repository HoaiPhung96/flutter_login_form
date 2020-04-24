import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_form/screens/first_page.dart';
import 'package:login_form/screens/second_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int currentTabIndex = 0;
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    FirstPage(),
    SecondPage(),
  ];



  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Trang chủ"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Cài đăt"),
          ),
          
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FirstPage();
              break;
            case 1:
              return SecondPage();
              break;
            default:
              return FirstPage();
              break;
          }
        });
  }
}