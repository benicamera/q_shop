/*  detail_item_title_with_icon.dart
*   @author: Benjamin Dangl
*   @version: 27.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';

class DetailItemTitleWithIcon extends StatelessWidget {
  final int itemId = 1; //TODO: get item id
  const DetailItemTitleWithIcon({
    Key key,
    @required this.itemName,
    @required this.itemCat,
    @required this.size,
    @required this.itemIcon,
  }) : super(key: key);

  final String itemName;
  final String itemCat;
  final Size size;
  final IconData itemIcon;


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
            tag: (itemName + "2"),
            child: Text(
            itemName,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: kLightGrey2, fontWeight: FontWeight.bold),
          ),),
          Text(
            itemCat,
            style: TextStyle(color: kDarkGrey1),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: size.width / 2.8),
                child: Hero(tag: (itemName + "1"), child: Icon(
                  itemIcon,
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