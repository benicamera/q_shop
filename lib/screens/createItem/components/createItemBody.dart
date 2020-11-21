/*  detail_body.dart
*   @author: Benjamin Dangl
*   @version: 15.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/createItem/components/createItem_title_with_icon.dart';
import 'package:q_shop/screens/details/components/detail_amount_select.dart';
import 'package:q_shop/screens/details/components/detail_note.dart';


class CreateItemBody extends StatelessWidget {
  ListProduct listProduct;
  Product product;

  CreateItemBody(
      {Key key, this.listProduct, this.product})
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
                              child: Text("createItemBody.dart, Line: 54")) //DetailAmount("2 Stk", 0))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: 20,
                      ),
                      SingleChildScrollView(
                        child: DetailNote(size: size, product: listProduct,))
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