/*  createItem_editable_title.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EditableItemTitle extends StatefulWidget {
  @override
  _EditableItemTitleState createState() => _EditableItemTitleState();
}

class _EditableItemTitleState extends State<EditableItemTitle> {
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "Unbenannt";

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

  @override
  Widget build(BuildContext context) {
    if (_isEditingText)
      return Center(
        child: TextField(
          style: Theme.of(context).textTheme.headline4.copyWith(
              color: kLightGrey2, fontWeight: FontWeight.bold),
          onSubmitted: (newValue){
            setState(() {
              //TODO: save text
              initialText = newValue;
              _isEditingText =false;
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
          style:
            Theme.of(context).textTheme.headline4.copyWith(
                color: kLightGrey2, fontWeight: FontWeight.bold),
        ));
  }
}
