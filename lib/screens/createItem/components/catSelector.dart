/*  catSelector.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import '../../../constants.dart';

class CatSelector extends StatefulWidget {
  final Product product;
  final ListProduct listProduct;
  String defCat = "Sonstige";
  CatSelector({this.product, this.listProduct});

  @override
  _CatSelector createState() =>
      _CatSelector(category: defCat, product: this.product, listProduct: this.listProduct);
}

class _CatSelector extends State<CatSelector> {
  final Product product;
  final ListProduct listProduct;
  String category;
  final textController = TextEditingController();

  _CatSelector({this.product, this.listProduct, this.category});

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        DropdownButton<String>(
          value: category,
          elevation: 10,
          dropdownColor: kWhite,
          style: TextStyle(color: kDarkGrey1),
          underline: Container(
            height: 1,
            color: kDarkGrey1,
          ),
          onChanged: (String newValue) {
            setState(() {
              category = newValue;
              print(newValue);
              product.setCat(newValue);
              print(newValue + " 1");
              listProduct.setCat(newValue);
              print(newValue + " 2");
            });
          },
          items: <String>['Obst', 'Gemüse', 'Sonstige'] //TODO: Alle Kategorien hinzufügen
              .map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
  }
}