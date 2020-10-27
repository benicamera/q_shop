/*  item_button_widget.dart
*   @author: Benjamin Dangl
*   @version: 26.10.2020
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/icons.dart';
import 'package:q_shop/screens/details/details_screen.dart';

import '../constants.dart';

class ItemWidget extends StatelessWidget {
  final String itemName;
  final String itemWeight;

  ItemWidget({this.itemName, this.itemWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          print("Longpress");
        }, //TODO: Beweglich Löschen oder abhaken
        onTap: () {
          print("tapped");
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              DetailsScreen(
                itemName: itemName, weight: itemWeight, itemIcon: apfel,)));
        }, //TODO: Details aufrufen
        child: Container(
          child: new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              ItemWidgetRoot(
                itemName: itemName,
                itemIcon: apfel, //TODO: get icon
              ),
              Text(
                itemWeight, //TODO: Menge hinzufügen
                style: TextStyle(
                    color: kWhite, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}

class ItemWidgetRoot extends StatelessWidget {
  final itemName;
  final IconData itemIcon;
  final int itemId = 1; //TODO: get ItemId

  ItemWidgetRoot({this.itemName, this.itemIcon});

  String shortItem(String name) {
    String _name = name;
    if (_name.length > 11) {
      _name = _name.substring(0, 11);
      _name = _name + "...";
      return _name;
    }
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kBluGreyS3,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kWidgRadius))),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: kDefPadding / 2,
                      right: kDefPadding / 2,
                      top: kDefPadding / 2),
                  child: Hero(
                    tag: "apfel1",
                      child: Icon(
                    itemIcon, //TODO: Item icon hinzufügen
                    color: kBluGreyS1,
                    size: 50,
                  ))),
              Padding(
                padding:
                EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                child: AutoSizeText(
                  shortItem(itemName),
                  style: TextStyle(color: kWhite),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ));
  }
}
