import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';


class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyHomePage(),
    );
  }
}
 class MyHomePage extends StatelessWidget {
  List<String> items = List<String>.generate(20, (int counter) => "item#$counter");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
          itemExtent: 220,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(items[index]),
            );
          }
      ),
    );
  }
 }