/*  main_divider_bar.dart
*   @author: Benjamin Dangl
*   @version: 23.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';

class DividerBar extends StatelessWidget {
  final String title;

  DividerBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 1.0),
        child:
        Divider(
          endIndent: 3.0,
          color: kLightGrey1,
          thickness: 1,
        ),
      ),
      Container(
          decoration: BoxDecoration(
            color: kBGColor,
            border: Border.all(color: kLightGrey1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding:
            EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2),
            child: Text(
              title,
              style: TextStyle(color: kLightGrey1, fontSize: 20),
            ),
          )),
      Expanded(
        child: Divider(
          indent: 3.0,
          color: kLightGrey1,
          thickness: 1,
        ),
      )
    ]);
  }
}