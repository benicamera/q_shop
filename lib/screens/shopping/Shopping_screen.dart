import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/icons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/shopping/components/swipeList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';


class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,

    home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  ShopList list;
  
  Future<ShopList> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final box = Hive.box("shopLists");
    int index = prefs.getInt("currentListIndex");
    if (index == null || index < 0) {
      index = 0;
      prefs.setInt("currentListIndex", 0);
      return box.getAt(0);
    }
    return box.getAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
        appBar: buildAppBar(),
        body: FutureBuilder<ShopList>(
          future: getList(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              ShopList list = snapshot.data;
              return SwipeList(list: list,);
            }
            if(snapshot.hasError){
              return Text(snapshot.error, style: TextStyle(color: kRed),);
            }
            return Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ));
          },
        )
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kDarkGrey3,
      //TODO: Änderung vorgenommen
      elevation: 2.0,
      title: Text(
        "  " + kTitle,
        style: TextStyle(
          color: kWhite,
          fontWeight: FontWeight.bold,
          fontSize: 35,
          fontStyle: null,
          fontFamily: null,
        ),
      ),
      shadowColor: kBGColor,
      actions: <Widget>[

        IconButton(
          icon: Icon(
            Icons.settings,
            color: kGrey,
          ),
          tooltip: null,
          onPressed: () {
            print("Einstellungen");
          } /*TODO: Settingsscreen aufrufen*/,
        ),
        SizedBox(
          width: kDefPadding / 2,
        )
      ],
    );
  }
}
