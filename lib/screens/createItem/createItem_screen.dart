/*  createItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */
import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/createItem/components/createItemBody.dart';
import 'package:q_shop/screens/details/components/detail_body.dart';
import '../../constants.dart';

class CreateItemScreen extends StatelessWidget {
  Product product =
      Product(name: "Unbenannt", cat: "Sonstige", iconCode: "0xe901");
  ListProduct lProduct = ListProduct(
      name: "Unbenannt",
      cat: "Sonstige",
      iconCode: "0xe901",
      amount: "2,0 Stk.",
      note: "Platz für Notizen");

  CreateItemScreen({
    Key key,
  }) : super(key: key);

//TODO: SAVE EVERYTHING WHEN GOING BACK
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomAppBar(),
      body: CreateItemBody(
        listProduct: lProduct,
        product: product,
      ), //TODO: Get cat
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save_alt,
              color: kGreen,
            ),
            onPressed: () {
              print("Save");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.check,
              color: kGreenH1,
            ),
            onPressed: () {
              print("Save and add");
            },
          ) //TODO: Save
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
