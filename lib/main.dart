/*  main.dart
*   @author: Benjamin Dangl
*   @version: 21.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'screens/main/main_screen.dart';
import 'screens/shopping/Shopping_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State<MyApp> {
  int _selectedTab = 0;
  final _pageOptions = [
    MainScreen(),
    Text("Shopping"),
    Text("Save")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'qShop!',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kGrey),
        visualDensity: VisualDensity.adaptivePlatformDensity,),
      home: Scaffold(
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          backgroundColor: kDarkGrey3,
          selectedItemColor: kBluGreyS1,
          unselectedItemColor: kGrey,
          showSelectedLabels: false,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sd_card),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }}