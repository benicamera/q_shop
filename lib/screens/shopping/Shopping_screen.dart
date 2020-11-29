import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/icons.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
        body: Center(child: SwipeList()));
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
                  size: 100,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
                color: kBluGreyS2,
                elevation: 5,
                child: Container(
                  height: 225.0,
                  width: 400,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 225.0,
                        width: 225.0,
                        color: Colors.blue,
                      ),
                      Container(
                        height: 225.0,
                        width: 150.0,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 25,
                                color: Colors.amber,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(items[index],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                ),
                  ),
                ),
              );
          },
        )
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
