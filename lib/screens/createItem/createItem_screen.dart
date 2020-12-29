/*  createItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
      icon: Appicons.Plus1,
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
              Icons.save_alt,
              color: kGreen,
            ),
            onPressed: () {
              print("Save");
              saveProduct(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.check,
              color: kGreenH1,
            ),
            onPressed: () {
              print("Save and add");
              saveAndAdd(context);
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ) //TODO: Save
        ],
      ),
    );
  }

  void saveAndAdd(BuildContext context){
    saveProduct(context);
    var listBox = Hive.box('shopLists');
    ShopList list = listBox.getAt(index);
    list.products.add(lProduct);
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
