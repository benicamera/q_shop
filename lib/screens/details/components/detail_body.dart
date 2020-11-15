/*  detail_body.dart
*   @author: Benjamin Dangl
*   @version: 15.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'detail_amount_select.dart';
import 'detail_item_title_with_icon.dart';
import 'detail_note.dart';

class DetailBody extends StatelessWidget {
  final String itemName;
  final String weight;
  final IconData itemIcon;
  final String itemCat;
  String notes = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.";

  DetailBody(
      {Key key, this.itemName, this.weight, this.itemIcon, this.itemCat})
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
                  height: 500,
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
                      Container(height: 10000 , child: DetailNote(size: size, notes: notes),)
                    ],
                  ),
                ),
                DetailItemTitleWithIcon(
                    itemName: itemName,
                    itemCat: itemCat,
                    size: size,
                    itemIcon: itemIcon)
              ],
            ),
          )
        ],
      ),
    );
  }
}

