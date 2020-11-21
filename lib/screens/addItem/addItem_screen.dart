/*  addItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';

import 'components/searchResult.dart';
import 'components/searchbar.dart';

class AddItemScreen extends StatefulWidget {

  const AddItemScreen({Key key,}) : super(key: key);
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  var searchResults = new List();

  _AddItemScreenState() {
    searchResults.add(Product(name: "Produkt erstellen", cat: "Sonstige"));
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
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
  /*
  //VON FELIX
  List getSearchResults(String inString) {
    List<String> resultList = new List<String>();
    List<String> inStringList = inString.split('');
    HashMap resultValueList = new HashMap<String,int>();
    int w = 0;
    for(int i = 0;i < allProducts.length;i++){
      if(allProducts[i].name.length == inStringList.length){
        w = realResults(inStringList, allProducts[i].name);
      }
      else{
        w=surrealResults(inStringList, allProducts[i].name);
      }
      resultValueList[allProducts[i]] = w;
    }
    var sortedMap = Map.fromEntries(
        resultValueList.entries.toList()
          ..sort((e1, e2) => e1.value.compareTo(e2.value)));
    print(sortedMap);
    return sortedMap.keys.toList();
  }

  int realResults(List<String> inStringList,String productString){
    List<String> productStringList = productString.split('');
    int nbError = 0;
    for(int i = 0;i < inStringList.length; i++){
      if(!(inStringList[i] == productStringList[i])){
        nbError++;
      }
    }

    return nbError;
  }

  int surrealResults(List<String> inStringList,String productString){
    List<String> productStringList = productString.split('');
    int nbCorrect = 0;
    for(int i = 0;i < inStringList.length; i++){
      for(int j = 0; j < productStringList.length;j++){
        if(inStringList[i] == productStringList[j]){
          nbCorrect++;
          productStringList.removeAt(j);
          j = productStringList.length;
        }
      }
    }
    return inStringList.length-nbCorrect;
  }*/
}


