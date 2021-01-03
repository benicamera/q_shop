/*  searchResult.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */
import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/details/details_screen.dart';
import 'package:q_shop/constants.dart';

class ItemButtonRestore extends StatelessWidget {
  const ItemButtonRestore({
    Key key,
    @required this.item, @required this.notifyParent, this.index
  }) : super(key: key);

  final ListProduct item;
  final Function() notifyParent;
  final int index;

  void toDetailScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
              product: item, index: index, add: true,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
              toDetailScreen(context);
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
                        kLightGrey2),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}