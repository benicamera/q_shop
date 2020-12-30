import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/defaultJsons.dart';
import 'package:q_shop/models/itemManageButton.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/addItem/components/searchResult.dart';
import 'package:q_shop/screens/main/components/main_divider_bar.dart';

import '../../../constants.dart';

class ManageProducts_Body extends StatefulWidget {
  @override
  _ManageProducts_BodyState createState() => _ManageProducts_BodyState();
}

class _ManageProducts_BodyState extends State<ManageProducts_Body> {
  List<Product> allProducts = new List();

  Future<bool> initAllProducts() async {
    final prodBox = await Hive.openBox('allProducts');
    print("addItem: $prodBox");
    if (prodBox.isEmpty) {
      print("addItem: $prodBox is empty");
      for (Product p in DefaultPrefs.defProducts) {
        print("addItem: $p");
        prodBox.add(p);
        allProducts.add(p);
      }
    } else {
      print("addItem: $prodBox is not empty");
      for (int i = 0; i < prodBox.length; i++) {
        Product product = prodBox.getAt(i);
        print("addItem: tries to add ${product.name}");
        allProducts.add(product);
      }
    }
    sortProductsAlphabet();
    return true;
  }

  void sortProductsAlphabet(){
      Product merke;
      for(int i=0;i<(allProducts.length-1);i++){
        merke = allProducts[i];
        if(!isOrder(merke.name,allProducts[i+1].name)){
          allProducts[i]= allProducts[i+1];
          allProducts[i+1]= merke;
          if(i!=0)i=i-2;
        }
      }
  }

  bool isOrder(String inString1, String inString2){
    inString1=inString1.toLowerCase();
    inString2=inString2.toLowerCase();
    int smallerLength;
    if(inString1.length<inString2.length)
      smallerLength =inString1.length;
    else
      smallerLength=inString2.length;

    for(int i=0;i<smallerLength;i++)   {
      if(inString1.codeUnitAt(i) < inString2.codeUnitAt(i))
        return true;
      else if (inString1.codeUnitAt(i) > inString2.codeUnitAt(i))
        return false;
    }
    if (inString1.length>inString2.length){
      return false;
    }
      return true;
    }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(
                snapshot.error.toString(),
                style: TextStyle(color: kRed),
              );
            else
              return Column(
                children: [
                  Container(height: MediaQuery.of(context).size.height / 100),
                  Container(height: MediaQuery.of(context).size.height / 60),
                  DividerBar(
                    title: "Produkte",
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: allProducts.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 20,
                                  vertical:
                                      MediaQuery.of(context).size.height / 50),
                              child: ItemManageButton(item: allProducts[i]),
                          );
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
        });
  }
}
