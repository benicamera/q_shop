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
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefPadding, vertical: kDefPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            itemName,
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: kLightGrey2, fontWeight: FontWeight.bold),
          ),
          Text(
            itemCat,
            style: TextStyle(color: kDarkGrey1),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: size.width / 2.5),
                child: Hero(tag: "apfel1", child: Icon(
                  itemIcon,
                  color: kBluGreyS1,
                  size: 200,
                ),)
              )
            ],
          )
        ],
      ),
    );
  }
}