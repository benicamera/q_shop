import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/icons.dart';


class ListScreen extends StatelessWidget {
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
    return Container(
      height: 20,
      width: 20,
      color: Colors.amber,
    );
  }
}