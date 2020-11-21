/*  detail_body.dart
*   @author: Benjamin Dangl
*   @version: 15.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';
import 'detail_amount_select.dart';
import 'detail_item_title_with_icon.dart';
import 'detail_note.dart';

class DetailBody extends StatelessWidget {
  final ListProduct product;
  final int index;

  DetailBody(
      {Key key, this.product, this.index})
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
                              child: DetailAmount(product.amount, index, product.name))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                        width: 20,
                      ),
                      Container(child: DetailNote(size: size, product: product, index: index,),)
                    ],
                  ),
                ),
                DetailItemTitleWithIcon(
                    product: product, size: size,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

