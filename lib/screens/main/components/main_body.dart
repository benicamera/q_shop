/*  main_body.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';

import 'item_overview.dart';

class Main_Body extends StatefulWidget {
  @override
  _Main_BodyState createState() => _Main_BodyState();
}

class _Main_BodyState extends State<Main_Body> {
  // ignore: non_constant_identifier_names
  ShopList shop_list;
  int unused = 0;

  _Main_BodyState({this.shop_list});

  //TODO: Kommt von JSON-Liste. Davor das Script ausführen
  var recommendations = new List();
  @override
  Widget build(BuildContext context) {
    try {
      Hive.registerAdapter(ShopListAdapter());
    }catch(err){
      print(err.toString());
    }
    try {
      Hive.registerAdapter(ProductAdapter());
    }catch(err){
      print(err.toString());
    }
    try {
      Hive.registerAdapter(ListProductAdapter());
    }catch(err){
      print(err.toString());
    }
    return FutureBuilder(
      future: Hive.openBox('shopLists'),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(
              snapshot.error.toString(), style: TextStyle(color: kRed),);
          else
            return ItemOverview();
        }
        return SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        );
      },
    );
  }
}
