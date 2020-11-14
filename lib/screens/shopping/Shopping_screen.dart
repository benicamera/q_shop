import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'components/shopping_body.dart';

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey4,
      appBar: buildAppBar(),
      body: ShoppingScreen(),
      bottomNavigationBar: OwnBottomNavigationBar(selectedItem: 0,),
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
            Icons.add,
            color: kGrey,
          ),
          tooltip: null,
          onPressed: () {
            print("Item erstellen");
          } /*TODO: Item erstellen aufrufen*/,
        ),
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

class OwnBottomNavigationBar extends StatelessWidget {
  int selectedItem;
  OwnBottomNavigationBar({this.selectedItem});
  @override
  Widget build(BuildContext context) {
    //TODO: onTap:
    return BottomNavigationBar(
      backgroundColor: kDarkGrey3,
      selectedItemColor: kBluGreyS1,
      unselectedItemColor: kGrey,
      showSelectedLabels: false,
      iconSize: 30,
      currentIndex: selectedItem,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.list), title: Text("")),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.sd_card), title: Text(''))
      ],
    );
  }
}
