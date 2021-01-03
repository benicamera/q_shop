import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/icons.dart';
import 'package:q_shop/models/appicons_icons.dart';

class ListScreen extends StatefulWidget{
  const ListScreen({Key key}) : super(key: key);
  @override
  _ListScreen createState() => _ListScreen();
}
class _ListScreen extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: MyHomePage(),

    );
  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey4,
        appBar: buildAppBar(),
        body: Page()
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
            Appicons.Zahnrad,
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
class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      color: Colors.yellow,
    );
  }
}