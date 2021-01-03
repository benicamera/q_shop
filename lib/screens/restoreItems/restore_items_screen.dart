/*  addItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/addItem/components/addItem_body.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';

import 'components/restore_items_body.dart';

class RestoreItemScreen extends StatefulWidget {
  final int index;

  const RestoreItemScreen({Key key, this.index,}) : super(key: key);
  @override
  _RestoreItemScreenState createState() => _RestoreItemScreenState(this.index);
}

class _RestoreItemScreenState extends State<RestoreItemScreen> {
  final int index;
  var searchResults = new List();

  _RestoreItemScreenState(this.index) {
    searchResults.add(Product(name: "Produkt erstellen", cat: "Sonstige"));
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  void refreshResults(String value) {

    print(value + " ... refreshing...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey4,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomAppBar(),
        body: RestoreItemScreenBody(index: index,));
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(),
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
    );
  }
}


