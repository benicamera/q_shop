/*  detail_body.dart
*   @author: Benjamin Dangl
*   @version: 26.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'detail_amount_select.dart';
import 'detail_item_title_with_icon.dart';

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
                      color: kGrey,
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
                      Padding(
                          padding:
                          EdgeInsetsDirectional.only(start: 10, end: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Notizen:",
                                style: TextStyle(color: kBlack, fontSize: 15),
                              ),

                              SizedBox(
                                height: 2,
                                width: size.width *0.6,
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, color: kBlack,),
                                iconSize: 15,
                                onPressed: (){}, //TODO: open editing mode for text
                              )
                            ],
                          )
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: size.width*0.05),
                          child: Text(
                          notes,
                          style: TextStyle(color: kBlack),
                        ),
                        )
                      )
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
