import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

  int getListIndex(String name, Box box){
    for(int i=0; i<box.length; i++){
      if(box.getAt(i).name == name)
        return i;
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('shopLists').listenable(),
      builder: (context, Box listBox, _) {
        return Container(
        child: (list.products.length > 0)? ListView.builder(
          itemCount: list.products.length,
          itemBuilder: (context, index) {
            return ShopItemWidget(product: list.products[index], list: list, onCheck: (direction) {
              setState(() {
                //TODO: Ab 3: wenn aus der mitte
                print("SwipeList - ShopItem checked before: " + list.checked.toString() + " " + index.toString());
                list.checked.add(list.products[index]);
                print("SwipeList - ShopItem checked after: " + list.checked.toString());
                print("SwipeList - ShopItem prods before: " + list.products.toString());
                list.products.removeAt(index);
                print("SwipeList - ShopItem prods after: " + list.products.toString());
                Hive.box("shopLists").putAt(getListIndex(list.name, Hive.box("shopLists")), list);
                setState(() { });
              });
            });
          },
        ):Center(child: Text("Keine Produkte auf der Liste.", style: TextStyle(color: kWhite),))
    );},
    );
  }
}
