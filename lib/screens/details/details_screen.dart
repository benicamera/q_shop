/*  details_screen.dart
*   @author: Benjamin Dangl
*   @version: 26.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/screens/details/components/detail_body.dart';
import '../../constants.dart';

class DetailsScreen extends StatelessWidget {
  final String itemName;
  final String weight;
  final IconData itemIcon;

  const DetailsScreen({Key key, this.itemName, this.weight, this.itemIcon})
      : super(key: key);

//TODO: SAVE EVERYTHING WHEN GOING BACK
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomAppBar(),
      body: DetailBody(itemIcon: itemIcon, weight: weight, itemName: itemName, itemCat: "Obst",), //TODO: Get cat
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(icon: Icon(Icons.check, color: kGreen,), onPressed: (){},),//TODO: action hinzufügen
          IconButton(icon: Icon(Icons.delete, color: kRed,), onPressed: (){},), //TODO: action hinzufügen
        ],
      ),
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
            Icons.settings,
            color: kGrey,
          ),
          tooltip: null,
          onPressed: () {
            print("Einstellungen");
          } /*TODO: Settingsscreen aufrufen*/,
        ),
        SizedBox(
          width: kDefPadding / 2,
        )
      ],
    );
  }
}
