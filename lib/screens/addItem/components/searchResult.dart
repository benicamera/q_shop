/*  searchResult.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */
import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/createItem/createItem_screen.dart';
import 'package:q_shop/screens/details/details_screen.dart';

import '../../../icons.dart';
import 'package:q_shop/constants.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key key,
    @required this.item, @required this.notifyParent, this.index
  }) : super(key: key);

  final Product item;
  final Function() notifyParent;
  final int index;

  void toDetailScreen(BuildContext context) {
    ListProduct listProduct = ListProduct(name: item.name, cat: item.cat, icon: item.icon, amount: "2.0 Stk.", note: "Platz für Notizen",);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
              product: listProduct, index: index, add: true,
            )));
  }
  
  void toCreateItem(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CreateItemScreen(index: index,)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          (item.name == "Produkt erstellen")
              ? toCreateItem(context)
              : toDetailScreen(context);
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width * 0.96,
          decoration: BoxDecoration(
            color: kDarkGrey1,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10),
                  child: Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 22,
                        color:
                        kLightGrey2), //TODO: Icon einfügen und automatic font
                  ),
                )
              ],
            ),
          ),
        ));
  }
}