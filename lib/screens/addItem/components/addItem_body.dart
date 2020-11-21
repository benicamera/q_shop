import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/defaultJsons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/addItem/components/searchResult.dart';
import 'package:q_shop/screens/addItem/components/searchbar.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';

import '../../../constants.dart';

class AddItemScreenBody extends StatefulWidget {
  final int index;

  const AddItemScreenBody({Key key, this.index}) : super(key: key);
  @override
  _AddItemScreenBodyState createState() => _AddItemScreenBodyState(this.index);
}

class _AddItemScreenBodyState extends State<AddItemScreenBody> {
  var searchResults = new List();
  String searchString;
  List<Product> allProducts = new List();
  final int index;

  _AddItemScreenBodyState(this.index) {
    searchResults.add(Product(name: "Produkt erstellen", cat: "Sonstige"));
  }

  void refreshResults(String value) {
    print(" ... refreshing...");
    searchResults.removeRange(1, searchResults.length);
    var res = getSearchResults(value).sublist(0, 7);
    print("refreshing: got all results");
    for(Product p in res){
      print(p.name);
      setState(() {
        searchString = value;
        searchResults.add(p);
      });

    }
  }

  Future<bool> initAllProducts() async{
    final prodBox = await Hive.openBox('allProducts');
    print("addItem: $prodBox");
    if(prodBox.isEmpty){
      print("addItem: $prodBox is empty");
      for(Product p in DefaultPrefs.defProducts){
        print("addItem: $p");
          prodBox.add(p);
          allProducts.add(p);
      }
    }else {
      print("addItem: $prodBox is not empty");
      for (int i = 0; i < prodBox.length; i++) {
        Product product = prodBox.getAt(i);
        print("addItem: tries to add ${product.name}");
        allProducts.add(product);
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initAllProducts(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(
              snapshot.error.toString(), style: TextStyle(color: kRed),);
          else
            return Column(
              children: [
                Container(height: MediaQuery.of(context).size.height / 100),
                Center(
                  child: SearchBar(
                    onChanged: (String value) {
                      refreshResults(value);
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
                            child: SearchResult(item: searchResults[i], index: index,));
                      }),
                )
              ],
            );
        }
        return SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        );
      }
    );
  }

  Product getProductByName(String name){
    for(Product p in allProducts){
      if(p.name == name)
        return p;
    }
  }

  List<Product> nameListToProductList(List inList){
    List<Product> outList = new List();
    for(String name in inList){
      outList.add(getProductByName(name));
    }
    return outList;
  }

  //VON FELIX
  List<Product> getSearchResults(String inString) {
    List<String> resultList = new List<String>();
    List<String> inStringList = inString.toLowerCase().split('');
    HashMap resultValueList = new HashMap<String,int>();
    int w = 0;

    for(int i = 0; i < allProducts.length;i++){
      if(allProducts[i].name.length == inStringList.length){
        w = realResults(inStringList, allProducts[i].name.toLowerCase());
      }
      else{
        w = surrealResults(inStringList, allProducts[i].name.toLowerCase());
      }
      resultValueList[allProducts[i].name] = w;
    }
    var sortedMap = Map.fromEntries(
        resultValueList.entries.toList()
          ..sort((e1, e2) => e1.value.compareTo(e2.value)));
    List sortedList = sortedMap.keys.toList();
    List<Product> outList = nameListToProductList(sortedList);
    return outList;
  }

  int realResults(List<String> inStringList, String productString){
    List<String> productStringList = productString.split('');
    int nbError = 0;
    for(int i = 0; i < inStringList.length; i++){
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
  }

}
