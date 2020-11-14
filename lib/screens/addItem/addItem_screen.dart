/*  addItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/main_divider_bar.dart';
import 'package:q_shop/screens/details/details_screen.dart';

import '../../icons.dart';
import 'components/searchResult.dart';
import 'components/searchbar.dart';

class AddItemScreen extends StatelessWidget {
  var searchResults = new List();

  AddItemScreen() {
    searchResults.add("Produkt erstellen");
  }

  void refreshResults(String value) {
    print(value + " ... refreshing...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkGrey4,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomAppBar(),
        body: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height / 100),
            Center(
              child: SearchBar(
                onChanged: (String value) {
                  refreshResults(value);
                  return;
                },
              ),
            ),
            Container(height: MediaQuery.of(context).size.height / 60),
            DividerBar(
              title: "Suchergebnisse",
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: searchResults.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 20,
                            vertical: MediaQuery.of(context).size.height / 50),
                        child: SearchResult(item: searchResults[i]));
                  }),
            )
          ],
        ));
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: kDarkGrey3,
      child: Row(),
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


