/*  detail_body.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/screens/createItem/components/createItem_title_with_icon.dart';
import 'package:q_shop/screens/details/components/detail_amount_select.dart';
import 'package:q_shop/screens/details/components/detail_note.dart';


class CreateItemBody extends StatelessWidget {

  String notes = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.";

  CreateItemBody(
      {Key key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //returns total height and width
    Size size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 5000,
                  decoration: BoxDecoration(
                      color: kLightGrey2,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.15,
                        width: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: size.width * 0.1),
                              child: DetailAmount("2 kg"))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: 20,
                      ),
                      SingleChildScrollView(
                        child: DetailNote(size: size, notes: notes))
                    ],
                  ),
                ),
                CreateItem_Title_Icon(),
              ],
            ),
          )
        ],
      ),
    );
  }
}