import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';

import '../../../constants.dart';

class EditableListName extends StatefulWidget {
  final ShopList list;

  const EditableListName({Key key, this.list}) : super(key: key);
  @override
  _EditableListNameState createState() => _EditableListNameState(list);
}

class _EditableListNameState extends State<EditableListName> {
  ShopList list;
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText;

  _EditableListNameState(ShopList _list){
    list = _list;
    initialText = list.name;
  }

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
    if (value == 'NeW?173') return false;
    Box shopLists = Hive.box('shopLists');
    for (int i = 0; i < shopLists.length; i++) {
      ShopList _list = shopLists.getAt(i);
      if (_list.name == value) return false;
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
                list.name = newValue;
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
                          "Entweder gibt es diesen Namen schon oder der Name gefährdet die Sicherheit der App.",
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

