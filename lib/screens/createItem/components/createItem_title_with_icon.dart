/*  createItem_title_with_icon.dart
*   @author: Benjamin Dangl
*   @version: 15.11.2020
 */
import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/screens/createItem/components/catSelector.dart';
import 'package:q_shop/screens/createItem/components/createItem_editable_title.dart';

class CreateItem_Title_Icon extends StatelessWidget {
  final int itemId = 1; //TODO: get item id
  const CreateItem_Title_Icon({
    Key key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: kDefPadding * 2, horizontal: MediaQuery.of(context).size.width / 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EditableItemTitle(),
          CatSelector(),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: MediaQuery.of(context).size.width / 2.5),
                  child: InkWell(
                    onTap: (){} , //TODO: add Iconselector
                    child: Icon(
                    Icons.add,
                    color: kBluGreyS1,
                      size: MediaQuery.of(context).size.width * MediaQuery.of(context).size.height / 1360,
                  ),)
              )
            ],
          )
        ],
      ),
    );
  }
}
