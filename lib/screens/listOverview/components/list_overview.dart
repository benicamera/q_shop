import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/listOverview/components/lists_gridview.dart';
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
    //TODO: Wenn keine Liste, dann Button um Liste zu erstellen einblenden
    return listBox.isEmpty? Text("keine Liste gefunden"):buildFutureBuilder();
  }

  FutureBuilder<int> buildFutureBuilder() {
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
        return ListGridView(index: listIndex,);
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