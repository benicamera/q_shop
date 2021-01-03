
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';
import 'package:q_shop/screens/restoreItems/components/item_button_restore.dart';

class RestoreItemScreenBody extends StatefulWidget {
  final int index;

  const RestoreItemScreenBody({Key key, this.index}) : super(key: key);
  @override
  _RestoreItemScreenBodyState createState() => _RestoreItemScreenBodyState(this.index);
}

class _RestoreItemScreenBodyState extends State<RestoreItemScreenBody> {
  var items = new List();
  final int index;
  ShopList list;

  _RestoreItemScreenBodyState(this.index) {
    getList();
    print(items.toString());
  }

  void getList(){
    Box box = Hive.box('shopLists');
    list = box.getAt(index);
    items = list.checked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Container(height: MediaQuery.of(context).size.height / 100),
                  DividerBar(
                    title: "Produkte",
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MediaQuery.of(context).size.width / 20,
                                  vertical: MediaQuery.of(context).size.height / 50),
                              child: ItemButtonRestore(item: items[i], index: index,));
                        }),
                  )
                ],
              );
          }

}