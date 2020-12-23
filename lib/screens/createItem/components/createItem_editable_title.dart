/*  createItem_editable_title.dart
*   @author: Benjamin Dangl
*   @version: 15.11.2020
 */
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';

import '../../../constants.dart';

class EditableItemTitle extends StatefulWidget {
  final Product product;
  final ListProduct listProduct;

  const EditableItemTitle({Key key, this.product, this.listProduct})
      : super(key: key);

  @override
  _EditableItemTitleState createState() =>
      _EditableItemTitleState(product, listProduct);
}

class _EditableItemTitleState extends State<EditableItemTitle> {
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "Unbenannt";
  final Product product;
  final ListProduct listProduct;

  _EditableItemTitleState(this.product, this.listProduct);

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  bool notTaken(String value) {
    if (value == "NeW?1!83") return false;
    var allProds = Hive.box('shopLists');
    for (int i = 0; i < allProds.length; i++) {
      Product prod = allProds.getAt(i);
      if (prod.name == value) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditingText)
      return Center(
        child: TextField(
          maxLength: 45,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: kLightGrey2, fontWeight: FontWeight.bold),
          onSubmitted: (newValue) {
            setState(() {
              if (notTaken(newValue)) {
                initialText = newValue;
                product.name = newValue;
                listProduct.name = newValue;
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Bennenung nicht möglich",
                          style: TextStyle(color: kRed),
                        ),
                        content: Text(
                          "Entweder gibt es dieses Produkt schon oder der Name gefährdet die Sicherheit der App.",
                          style: TextStyle(color: kBlack),
                        ),
                        actions: [
                          new FlatButton(
                            child: new Text(
                              "Verstanden",
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }
              _isEditingText = false;
            });
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
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: kLightGrey2, fontWeight: FontWeight.bold),
        ));
  }
}
