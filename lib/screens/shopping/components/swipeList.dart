import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/shopping/components/shopItemWidget.dart';

import '../../../constants.dart';

class SwipeList extends StatefulWidget {
  final ShopList list;

  const SwipeList({Key key, this.list}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget(list);
  }
}

class ListItemWidget extends State<SwipeList> {
  final ShopList list;
  ListItemWidget(this.list);

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (list.products.length > 0)? ListView.builder(
          itemCount: list.products.length,
          itemBuilder: (context, index) {
            return ShopItemWidget(product: list.products[index], list: list, onCheck: (direction) {
              setState(() {
                list.checked.add(list.products[index]);
                print(index);
                list.products.removeAt(index);
                if(list.products.length < 2){
                  list.products = [];
                }
                print("dismissed: " + list.products.toString() + " " + list.checked.toString());
              });
            });
          },
        ):Center(child: Text("Keine Produkte auf der Liste.", style: TextStyle(color: kWhite),))
    );
  }

}
