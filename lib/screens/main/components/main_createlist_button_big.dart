/*  main_createlist_button_big.dart
*   @author: Benjamin Dangl
*   @version: 23.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';

class CreateList_Button_Big extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBluGreyS3,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kWidgRadius))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: kDefPadding, right: kDefPadding, top: kDefPadding),
            child: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: kBluGreyS1,
              foregroundColor: kWhite,
              onPressed: () {
                print("Liste erstellen");
              } /*TODO: Create list screen*/,
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(kDefPadding),
            child: Text(
              'Liste erstellen.',
              style: TextStyle(color: kWhite),
            ),
          )
        ],
      ),
    );
  }
}