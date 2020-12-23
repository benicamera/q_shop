/*  main.dart
*   @author: Benjamin Dangl
*   @version: 21.10.2020
 */

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/screens/listOverview/listOverview_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/shopping/Shopping_screen.dart';
import 'file:///C:/Users/Beni/AndroidStudioProjects/q_shop/lib/screens/listOverview/components/listOverview_body.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}


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
    ShoppingScreen(),
    ListOverviewScreen(),
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
              icon: Icon(Appicons.Menue),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Appicons.Einkaufswagen),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Appicons.Karten),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }}