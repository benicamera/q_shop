/*  main_shopping_list_view.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import '../../../models/item_button_widget.dart';

class ShoppingListView extends StatefulWidget {
  ShopList list;
  int index;
  bool isProposals = false;

  ShoppingListView({this.list, this.index, this.isProposals});

  @override
  _ShoppingListView createState() => _ShoppingListView(
      help_list: this.list, isProposals: this.isProposals, index: this.index);
}

class _ShoppingListView extends State<ShoppingListView> {
  var list = new List();
  int index;
  ShopList help_list;
  bool isProposals = false;
  int numElements;

  _ShoppingListView({this.help_list, this.index, this.isProposals});

  bool noNew(){
    for(int i = 0; i < help_list.products.length; i++){
      if(help_list.products[i].name == "NeW?1!83")
        return false;
    }
    for(var e in list){
      if(e.name == "NeW?1!83")
        return false;
    }
    return true;
  }

  bool onList(String name){
    for(var e in list){
      if(e.name == name)
        return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (noNew())
      list.add(ListProduct(
          name: "NeW?1!83",
          cat: "Sonstige",
          iconCode: "0xe901",
          amount: "2 Stk.",
          note: ""));

    for (var e in help_list.products) {
      print("shooping_list_view name of product to add: " + e.name);
      if(!onList(e.name))
        list.add(e);
    }
    return GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      scrollDirection: Axis.vertical,
      primary: false,
      reverse: false,
      shrinkWrap: true,
      itemCount: this.isProposals == true ? 1 : list.length,
      //TODO: ABSOLUT NICHTS DOPPELT AUF DEN LISTEN HABEN!!
      physics: ScrollPhysics(),
      itemBuilder: (context, int i) {
        print(list);
        return (!isProposals)
                ? ItemWidget(
                    listProduct: list[i],
                    index: index,
                  )
                : Text("Hier steht ein Vorschlag") //TODO: Bedingung ändern
            ; //TODO: Liste automatisch übernehmen
      },
    );
  }
}
