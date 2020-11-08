/*  main_shopping_list_view.dart
*   @author: Benjamin Dangl
*   @version: 26.10.2020
 */

import 'package:flutter/material.dart';
import 'item_button_widget.dart';

class ShoppingListView extends StatefulWidget {
  var list = new List();
  bool isProposals = false;
  ShoppingListView({this.list, this.isProposals});
  @override
  _ShoppingListView createState() => _ShoppingListView(list: this.list, isProposals: this.isProposals);
}
class _ShoppingListView extends State<ShoppingListView> {
  var list = new List();
  bool isProposals = false;
  int numElements;

  _ShoppingListView({this.list, this.isProposals});

  @override
  Widget build(BuildContext context) {
    //TODO: entfernen
    list.add(["Zitrone", "4 Stk."],);
    list.add(["Bier", "1 l"],);
    list.add(["Brot", "0,5 kg"],);
    list.add(["NEW", ""],);
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      scrollDirection: Axis.vertical,
      primary: false,
      reverse: false,
      shrinkWrap: true,
      itemCount: this.isProposals == true ? 1: list.length ~/ 2, //TODO: ABSOLUT NICHTS DOPPELT AUF DEN LISTEN HABEN!!
      physics: ScrollPhysics(),
      itemBuilder: (context, int i){
        return (!isProposals)? ItemWidget(itemName: list[i][0], itemWeight: list[i][1], isProposals: true, isNewItem: (list[i][0] == "NEW")? true : false,): ItemWidget(
          itemName: "Apfel",
          itemWeight: "2 kg",
          isProposals: true,
          isNewItem: false,)
        ; //TODO: Liste automatisch übernehmen
      },

    );
  }

}
