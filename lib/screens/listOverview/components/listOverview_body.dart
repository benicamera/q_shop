import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';

import 'list_overview.dart';

class ListOverview_Body extends StatefulWidget {
  @override
  _ListOverview_BodyState createState() => _ListOverview_BodyState();
}

class _ListOverview_BodyState extends State<ListOverview_Body> {
  // ignore: non_constant_identifier_names
  int unused = 0;

  _ListOverview_BodyState();

  @override
  Widget build(BuildContext context) {
    try {
      Hive.registerAdapter(ShopListAdapter());
    } catch (err) {
      print(err.toString());
    }
    return Container(
        color: kDarkGrey4,
        child: FutureBuilder(
          future: Hive.openBox('shopLists'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: kRed),
                );
              else
                return ListOverview();
            }
            return Center(
                child: SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ));
          },
        ));
  }
}
