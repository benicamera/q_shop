import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/main/components/main_shopping_list_view.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';
import 'package:q_shop/screens/main/components/proposal_overview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class ItemOverview extends StatefulWidget {
  @override
  _ItemOverviewState createState() => _ItemOverviewState();
}

class _ItemOverviewState extends State<ItemOverview> {
  final listBox = Hive.box('shopLists');
  int listIndex;
  void callBack() {
    setState(() {});
  }

  Future<int> getListIndex() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt("currentListIndex");
    print("ItemOverview getListIndex: " +
        index.toString() +
        " " +
        listBox.length.toString());
    if (index == null || index >= listBox.length) {
      listIndex = 0;
      prefs.setInt("currentListIndex", 0);
      return 0;
    }
    listIndex = index;
    return index;
  }

  @override
  Widget build(BuildContext context) {
    print("ItemOverview - build: ListBox: " + listBox.toString());
    if (listBox.isEmpty) {
      listBox.add(ShopList(name: "Liste", products: [
        ListProduct(
            name: "Tomate",
            cat: "Gemüse",
            icon: Appicons.Tomate1,
            amount: "2 Stk.",
            note: "Schwarze Tomaten")
      ], checked: []));
    }
    return FutureBuilder(
      future: getListIndex(),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Text(
            snapshot.error.toString(),
            style: TextStyle(color: kRed),
          );
        if (snapshot.hasData) {
          listIndex = snapshot.data;
          ShopList shopList = listBox.getAt(snapshot.data);
          print("ItemOverview - FutureBuilder: " +
              shopList.name +
              " " +
              shopList.products.toString());
          return ListView(
            padding: EdgeInsets.only(top: 5, right: 23, bottom: 5),
            children: <Widget>[
              DividerBar(
                title: shopList.name,
              ),
              Expanded(
                child: Align(
                  // ignore: deprecated_member_use
                  child: ValueListenableBuilder(
                      valueListenable: Hive.box('shopLists').listenable(),
                      builder: (context, Box listBox, _) {
                        return ShoppingListView(
                            list: listBox.getAt(listIndex),
                            index: listIndex,
                            isProposals: false,
                            callBack: () {
                              callBack();
                            });
                      }),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: DividerBar(
                    title: "Vorschläge",
                  )),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(child: ProposalOverview(index: listIndex)) //TODO: Vorschläge einfügen
                  )
            ],
          );
        }
        return Center(
            child: SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        ));
      },
    );
  }
}
