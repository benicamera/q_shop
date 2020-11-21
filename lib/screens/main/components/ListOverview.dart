import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/main/components/main_shopping_list_view.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class ListOverview extends StatefulWidget {
  @override
  _ListOverviewState createState() => _ListOverviewState();
}

class _ListOverviewState extends State<ListOverview> {
  final listBox = Hive.box('shopLists');
  int listIndex;

  Future<int> getListIndex() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt("currentListIndex");
    if (index == null) {
      listIndex = 0;
      return 0;
    }
    listIndex = index;
    return index;
  }

  @override
  Widget build(BuildContext context) {
    print("ListBox: " + listBox.toString());
    if (listBox.isEmpty) {
      //TODO: Button which navigates to manage Lists screen or create list screen
      listBox.add(ShopList(name: "test", products: [
        ListProduct(
            name: "Tomate",
            cat: "Gemüse",
            iconCode: "0xe901",
            amount: "2 Stk.",
            note: "Schwarze Tomaten")
      ]));
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
          return ListView(
            padding: EdgeInsets.only(top: 5, right: 23, bottom: 5),
            children: <Widget>[
              DividerBar(
                title: shopList.name,
              ),
              Expanded(
                child: Align(
                  child: WatchBoxBuilder(
                      box: Hive.box('shopLists'),
                      builder: (context, listBox) {
                        return ShoppingListView(
                          list: listBox.getAt(listIndex),
                          index: listIndex,
                          isProposals: false,
                        );
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
                child: ShoppingListView(
                  list: ShopList(name: "", products: []),
                  index: listIndex,
                  isProposals: true,
                ), //TODO: Vorschläge einfügen
              )
            ], //TODO: Title der Liste Padding(
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
