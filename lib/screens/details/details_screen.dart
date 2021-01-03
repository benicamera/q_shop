/*  details_screen.dart
*   @author: Benjamin Dangl
*   @version: 30.10.2020
 */

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/details/components/detail_body.dart';
import 'package:q_shop/screens/main/main_screen.dart';
import '../../constants.dart';
import 'package:q_shop/models/publicFunctions.dart';

class DetailsScreen extends StatelessWidget {
  final ListProduct product;
  final int index;
  final bool add;

  const DetailsScreen({Key key, this.product, this.index, this.add})
      : super(key: key);

//TODO: SAVE EVERYTHING WHEN GOING BACK
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomAppBar(context),
      body:
          DetailBody(product: product, index: index, add: add), //TODO: Get cat
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          (!add)?IconButton(
            icon: Icon(
              Icons.check,
              color: kGreen,
            ),
            onPressed: () {
              check();
              Navigator.of(context).pop();
            },
          ) : SizedBox(width: 1, height: 1,),
          (add)
              ? IconButton(
                  icon: Icon(
                    Icons.add,
                    color: kGreen,
                  ),
                  onPressed: () {
                    addToList(context);
                  },
                )
              : IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: kRed,
                      ),
                      onPressed: () {asKForRemoval(context);},
                    ),
          //TODO: Bedingung ändern und action hinzufügen
        ],
      ),
    );
  }

  void check(){
    print("in Check");
    PublicFunctions.checkItem(product.name, 'shopLists', index);
    print("after Check");
  }

  void removeFromList(bool prodList) {
    final box = Hive.box('shopLists');
    ShopList list = box.getAt(index);
    int prodI = (prodList)?getIndexFromProductName(list, product.name):getCheckIndex(list);
    print("DetailScreen: $prodI");
    if(prodList)
      list.products.removeAt(prodI);
    else
      list.checked.removeAt(prodI);
    box.putAt(index, list);
  }

  void asKForRemoval(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Wirklich löschen?", style: TextStyle(color: kRed),),
          content: Text("Du bist im Begriff den Artikel von der Liste zu entfernen. Dies löscht deine Mengenangabe und die Notizen. \n"
              "Der Artikel kann später wieder hinzugefügt werden, die Mengenangabe und die Notizen bleiben allerdings gelöscht."),
          actions: [
            FlatButton(
              child: Text("Abbrechen"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Löschen", style: TextStyle(color: kRed),),
              onPressed: (){
                print("DetailsScreen: Löschen");
                removeFromList(true);
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  int getIndexFromProductName(ShopList list, String name) {
    print("DetailScreen: name to remove: $name");
    List<ListProduct> prods = list.products;
    for (int i = 0; i < list.products.length; i++) {
      if (name == list.products[i].name) return i;
    }
    return 0;
  }

  void addToList(BuildContext context) {
    print("DetailScreen: in addToList");
    final box = Hive.box('shopLists');
    ShopList list = box.getAt(index);
    if (productInList(product, list)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Bereits auf der Liste",
                style: TextStyle(color: kRed),
              ),
              content: Text(
                "Dieser Artikel ist bereits auf der Liste. Wähle eine andere Liste oder bearbeite den Artikel über die Artikelübersicht.",
                style: TextStyle(color: kBlack),
              ),
              actions: [
                new FlatButton(
                  child: new Text(
                    "Verstanden",
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      addToProducts();
      int checkInd = getCheckIndex(list);
      if(checkInd > -1)
        removeFromList(false);
      print(box.getAt(index).products.toString());
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }
  void addToProducts() {
    final box = Hive.box('shopLists');
    ShopList list = box.getAt(index);
    list.products.add(product);
    print(list.products.toString());
    print(box.length.toString() + " index: " + index.toString());
    box.putAt(index, list);
    Hive.box("shopLists").putAt(index, list);
  }
  
  int getCheckIndex(ShopList list){
    for(int i=0; i<list.checked.length; i++){
      if(product.name == list.checked[i].name)
        return i;
    }
    return -1;
  }

  bool productInList(ListProduct product, ShopList list) {
    String name = product.name;
    List<ListProduct> prodList = list.products;
    for (ListProduct p in prodList) {
      if (p.name == name) return true;
    }
    return false;
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
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            color: kGrey,
          ),
          tooltip: null,
          onPressed: () {
            print("Einstellungen");
          } /*TODO: Settingsscreen aufrufen*/,
        ),
        SizedBox(width: 10 //kDefPadding / 2,
            )
      ],
    );
  }
}
