/*  item_button_widget.dart
*   @author: Benjamin Dangl
*   @version: 27.10.2020
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/icons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/addItem/addItem_screen.dart';
import 'package:q_shop/screens/details/details_screen.dart';

import '../constants.dart';

class ItemWidget extends StatelessWidget {
  final listProduct;
  int index;

  ItemWidget(
      {this.listProduct, this.index});

  void toDetailScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  product: listProduct, index: index
                )));
  }

  void toNewItem(BuildContext context) {
    print("To new Item");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItemScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          print("Longpress");
        }, //TODO: Beweglich Löschen oder abhaken
        onTap: () {
          print("tapped");
          listProduct.name == "NeW?1!83" ? toNewItem(context) : toDetailScreen(context); //TODO:CODE
        },
        child: Container(
          child: new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              ItemWidgetRoot(
                itemName: (listProduct.name == "NeW?1!83") ? "Produkt hinzufügen" : listProduct.name,
                itemIcon: (listProduct.name == "NeW?1!83") ? Icons.add : apfel, //TODO: get icon
              ),
              Text(
                (listProduct.name == "NeW?1!83") ? "" : listProduct.amount,
                style: TextStyle(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).size.width /
                        17000),
              ),
            ],
          ),
        ));
  }
}

class ItemWidgetRoot extends StatelessWidget {
  final itemName;
  final IconData itemIcon;
  final int itemId = 1; //TODO: get ItemId

  ItemWidgetRoot({this.itemName, this.itemIcon});

  String shortItem(String name) {
    String _name = name;
    if (_name.length > 11) {
      _name = _name.substring(0, 11);
      _name = _name + "...";
      return _name;
    }
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: kBluGreyS3,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kWidgRadius))),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: kDefPadding / 2,
                      right: kDefPadding / 2,
                      top: kDefPadding / 2),
                  child: Hero(
                      tag: (itemName + "1"),
                      child: Icon(
                        itemIcon, //TODO: Item icon hinzufügen
                        color: kBluGreyS1,
                        size: 50,
                      ))),
              Padding(
                padding:
                    EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                child: AutoSizeText(
                  shortItem(itemName),
                  style: TextStyle(color: kWhite),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ));
  }
}
