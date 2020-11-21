/*  detail_item_title_with_icon.dart
*   @author: Benjamin Dangl
*   @version: 27.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';

class DetailItemTitleWithIcon extends StatelessWidget {
  final ListProduct product;
  final size;
  const DetailItemTitleWithIcon({
    Key key,
    @required this.product, this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: kDefPadding * 2, horizontal: width / 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: (product.name + "2"),
            child: Text(
            product.name,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: kLightGrey2, fontWeight: FontWeight.bold),
          ),),
          Text(
            product.cat,
            style: TextStyle(color: kDarkGrey1),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: size.width / 2.8),
                child: Hero(tag: (product.name + "1"), child: Icon(
                  product.getIcon(),
                  color: kBluGreyS1,
                  size: size.width*size.height / 1360,
                ),)
              )
            ],
          )
        ],
      ),
    );
  }
}