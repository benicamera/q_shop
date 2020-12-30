import 'package:flutter/material.dart';
import 'package:q_shop/screens/manageProducts/components/manageProducts_body.dart';

import '../../constants.dart';

class ManageProducts_Screen extends StatefulWidget {
  @override
  _ManageProducts_ScreenState createState() => _ManageProducts_ScreenState();
}

class _ManageProducts_ScreenState extends State<ManageProducts_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      body: ManageProducts_Body(),
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
        SizedBox(
          width: kDefPadding / 2,
        )
      ],
    );
  }
}
