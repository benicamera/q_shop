import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import '../../../models/item_button_widget.dart';
import 'list_widget.dart';

class ListGridView extends StatefulWidget {
  int index;

  ListGridView({this.index});

  @override
  _ListGridView createState() => _ListGridView(index: this.index);
}

class _ListGridView extends State<ListGridView> {
  int index;
  _ListGridView({this.index});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('shopLists');
    print("List index: " + index.toString());
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box listBox, _) {
        return GridView.builder(
          gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          scrollDirection: Axis.vertical,
          primary: false,
          reverse: false,
          shrinkWrap: true,
          itemCount: listBox.length + 1,
          physics: ScrollPhysics(),
          itemBuilder: (context, int i) {
            if(i == 0){
              return ListWidget(isSelected: false, list: getAddList());
            }
            bool isSelected = (index == i - 1)? true : false;
            return ListWidget(isSelected: isSelected, list: listBox.getAt(i - 1));
          },
        );
      },
    );
  }
  ShopList getAddList(){
    ShopList addList = new ShopList(name: 'NeW?173', products: null);
    return addList;
  }
}