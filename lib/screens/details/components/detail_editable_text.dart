/*  detail_editable_Text.dart
*   @author: Benjamin Dangl u. https://medium.com/nonstopio/the-editable-text-in-a-flutter-aeca4e845cbb
*   @version: 30.10.2020
 */

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/products.dart';

class DetailEditableText extends StatefulWidget {
  final ListProduct product;
  final int index;
  final bool add;

  const DetailEditableText({Key key, this.product, this.index, this.add})
      : super(key: key);

  @override
  _DetailEditableTextState createState() =>
      _DetailEditableTextState(product: this.product, index: this.index);
}

class _DetailEditableTextState extends State<DetailEditableText> {
  final ListProduct product;
  final bool add;
  int index;
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "Platz für Notizen";

  _DetailEditableTextState(
      {this.product, this.index, this.add}); //TODO: get note

  @override
  void initState() {
    initialText = product.note;
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  void save() {
    var box = Hive.box('shopLists');

    ShopList currList = box.getAt(index);
    int prodIndex = getProdIndex(currList);

    currList.products[prodIndex].note = product.note;
    Hive.box('shopLists').putAt(index, currList);
  }

  int getProdIndex(ShopList currList) {
    List<ListProduct> prodList = currList.products;

    for (int i = 0; i < prodList.length; i++) {
      if (prodList[i].name == product.name) return i;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditingText)
      return Center(
        child: TextField(
          maxLength: 300,
          style: TextStyle(color: kBlack),
          onSubmitted: (newValue) {
            setState(() {
              product.note = newValue;
              product.toJson();
              initialText = newValue;
              _isEditingText = false;
            });
            (!add) ? save() : product.note = newValue;
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          initialText,
          style: TextStyle(
            color: kBlack,
            fontSize: 18.0,
          ),
        ));
  }
}
