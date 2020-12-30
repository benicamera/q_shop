/*  main_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/screens/settings/settings_screen.dart';
import 'components/main_body.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  /*
  int selectedItem = 0;
  final tabs = [
    Main_Body(),
    Center(child: Text("Shopping")),
    ListOverview_Body()
  ];*/

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      body: Main_Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kDarkGrey3,
      //TODO: Änderung vorgenommen
      elevation: 2.0,
      title: Text(
        "  " + kTitle,
        style: TextStyle(
          color: kWhite,
          fontWeight: FontWeight.bold,
          fontSize: 35,
          fontStyle: null,
          fontFamily: null,
        ),
      ),
      shadowColor: kBGColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Appicons.Zahnrad,
            color: kGrey,
          ),
          tooltip: null,
          onPressed: () {
            print("Einstellungen");
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
          }
        ),
        SizedBox(
          width: kDefPadding / 2,
        )
      ],
    );
  }
}


