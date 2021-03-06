/*  createItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/icons.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/createItem/components/createItemBody.dart';
import 'package:q_shop/screens/details/components/detail_body.dart';
import 'package:q_shop/screens/listOverview/listOverview_screen.dart';
import 'package:q_shop/screens/main/main_screen.dart';
import '../../constants.dart';

class CreateItemScreen extends StatelessWidget {
  final int index;
  Product product =
      Product(name: "Unbenannt", cat: "Sonstige", icon: Appicons.Plus1);
  ListProduct lProduct = ListProduct(
      name: "Unbenannt",
      cat: "Sonstige",
      icon: Appicons.Letters["u"],
      amount: "2,0 Stk.",
      note: "Platz für Notizen");

  CreateItemScreen({
    Key key, this.index,
  }) : super(key: key);

//TODO: SAVE EVERYTHING WHEN GOING BACK
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomAppBar(context),
      body: CreateItemBody(
        listProduct: lProduct,
        product: product,
        index: index,
      ), //TODO: Get cat
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Appicons.Plus1,
              color: kGreenH1,
            ),
            onPressed: () {
              print("Save and add");
              saveAndAdd(context);
            },
          ) //TODO: Save
        ],
      ),
    );
  }

  void saveAndAdd(BuildContext context){
    saveProduct(context);
    var listBox = Hive.box('shopLists');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Artikel hinzugefügt",
              style: TextStyle(color: kGreen),
            ),
            content: Text(
              "Artikel wurde erfolgreich hinzugefügt.",
              style: TextStyle(color: kBlack),
            ),
            actions: [
              new FlatButton(
                child: new Text(
                  "Verstanden",
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    Navigator.of(context).pop();
  }

  void saveProduct(BuildContext context) {
    var allProdsBox = Hive.box('allProducts');
    product.icon = Appicons.Letters[product.name.toLowerCase()[0]];
    print("Icon: " + product.icon.toString());
    allProdsBox.add(product);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Artikel erstellt",
              style: TextStyle(color: kGreen),
            ),
            content: Text(
              "Du findest den Artikel über die Suche und kannst ihn zu jeder Liste hinzufügen.",
              style: TextStyle(color: kBlack),
            ),
            actions: [
              new FlatButton(
                child: new Text(
                  "Verstanden",
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kDarkGrey3,
      //TODO: Änderung vorgenommen
      elevation: 2.0,
      title: Text(
        "  " + kTitle,
        style: TextStyle(
          color: kWhite,
          fontWeight: FontWeight.bold,
          fontSize: 35,
          fontStyle: null,
          fontFamily: null,
        ),
      ),
      shadowColor: kBGColor,
    );
  }
}
