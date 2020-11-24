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

                     /*Container(
                       height: 225.0,
                       width: 253,
                       child: Padding(
                       padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Container(
                             height: 43,
                           ),
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
                           Container(
                             height: 40,
                           ),
                           Container(
                             height: 68,
                             width: 250,
                             child: Padding(
                               padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Container(
                                     height: 65.0,
                                     width: 30.0,
                                   ),
                                   Container(
                                     height: 75.0,
                                     width: 75.0,
                                     color: Colors.brown,
                                   ),
                                   Container(
                                     height: 65.0,
                                     width: 30.0,
                                   ),
                                   Container(
                                     height: 75.0,
                                     width: 75.0,
                                     color: Colors.cyanAccent,
                                   ),
                                 ],
                               ),
                             ),
                           ),

                         ],
                       ),
                     ),
                     ),

                      */

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
