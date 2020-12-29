import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/listDetails/components/listDetails_body.dart';

import '../../constants.dart';

class ListDetailsScreen extends StatelessWidget {
  final bool selected;
  final ShopList list;

  const ListDetailsScreen({Key key, this.selected, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomAppBar(context),
      body: ListDetailsBody(selected: selected, list: list),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(" ", style: TextStyle(fontSize: 40),)
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kDarkGrey3,
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
