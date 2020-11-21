/*  details_screen.dart
*   @author: Benjamin Dangl
*   @version: 30.10.2020
 */
import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/details/components/detail_body.dart';
import '../../constants.dart';

class DetailsScreen extends StatelessWidget {
  final ListProduct product;
  final int index;

  const DetailsScreen({Key key, this.product, this.index})
      : super(key: key);

//TODO: SAVE EVERYTHING WHEN GOING BACK
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomAppBar(),
      body: DetailBody(product: product, index: index), //TODO: Get cat
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
          (false)?IconButton(icon: Icon(Icons.add, color: kGreen,), onPressed: (){},) : IconButton(icon: Icon(Icons.delete, color: kRed,), onPressed: (){},), //TODO: Bedingung ändern und action hinzufügen
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
          width: 10 //kDefPadding / 2,
        )
      ],
    );
  }
}
