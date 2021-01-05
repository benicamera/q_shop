
import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/screens/settings/settings_screen.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/shopping/components/swipeList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';
class ShoppingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey4,
        appBar: buildAppBar(),
        body: Center(child: SwipeList()));
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
            Appicons.Zahnrad,
            color: kGrey,
          ),
          tooltip: null,

        ),
        SizedBox(
          width: kDefPadding / 2,
        )
      ],
    );
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(

          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(items[index]),
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
                elevation: 5,
                child: Container(
                  height: 200.0,
                  width: 400,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 125.0,
                        width: 125.0,
                        color: Colors.blue,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 250,
                          ),
                          Container(
                            height: 25,
                            width: 250,
                            color: Colors.yellow,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 250,
                          ),
                          Container(
                            height: 25,
                            width: 250,
                            color: Colors.yellow,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 250,
                          ),
                          Container(
                            height: 25,
                            width: 250,
                            color: Colors.yellow,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }

}