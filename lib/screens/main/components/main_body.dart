/*  main_body.dart
*   @author: Benjamin Dangl
*   @version: 25.10.2020
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/models/main_createlist_button_big.dart';
import 'package:q_shop/models/main_shopping_list_view.dart';
import 'package:q_shop/models/main_divider_bar.dart';

class Main_Body extends StatefulWidget {
  @override
  _Main_BodyState createState() => _Main_BodyState();
}

class _Main_BodyState extends State<Main_Body> {
  //TODO: Liste kommt von JSON.
  var shop_list = new List();
  _Main_BodyState(){
    for(var i = 0; i <= 0; i++) {
      shop_list.add(["Apfelsinenmus", /*"2 kg"*/]);
    }
    print(shop_list);
  }

  //TODO: Kommt von JSON-Liste. Davor das Script ausführen
  var recommendations = new List();

  @override
  Widget build(BuildContext context) {
    if (shop_list.isEmpty) {
      return Column(
        children: <Widget>[
          Center(
            widthFactor: null,
            heightFactor: 4.0,
            child: CreateList_Button_Big(),
          )
        ],
      );
    }
    return ListView(
      padding: EdgeInsets.only(top: 5, right: 23, bottom: 5),
      children: <Widget> [ DividerBar(title: "Liste 1",), Expanded(
        child: Align(
          child: ShoppingListView(list: shop_list, isProposals: false,),
          alignment: Alignment.centerLeft,
        ), //TODO: Liste einfügen
      ),Padding(
          padding: EdgeInsets.only(top: 32),
          child: DividerBar(title: "Vorschläge",)
      ),Align(
        alignment: Alignment.centerLeft,
        child: ShoppingListView(list: new List(), isProposals: true,), //TODO: Vorschläge einfügen
      )], //TODO: Title der Liste] Padding(
        );
  }
}
