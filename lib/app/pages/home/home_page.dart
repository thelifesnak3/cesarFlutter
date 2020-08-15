import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/app/pages/home/tabs/activity_tab.dart';
import 'package:workout_app/app/pages/home/tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context).settings.arguments;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Color(getColorHexFromStr("#EFF3FF")),
        activeColor: Color(getColorHexFromStr("#6782E6")),
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run), title: Text("Activity")),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text("About"))
        ]
      ),
      tabBuilder: (BuildContext context, int index) {
       switch (index) {
          case 0:
            return HomeTab(email);
            break;
          case 1:
            return ActivityTab();
            break;
          case 2:
            return Container();
            break;
          default:
            return Container();
            break;
        } 
      },
    );
  }
}

int getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("An error occurred when converting a color");
    }
  }
  return val;
}