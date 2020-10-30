/*  detail_editable_Text.dart
*   @author: Benjamin Dangl u. https://medium.com/nonstopio/the-editable-text-in-a-flutter-aeca4e845cbb
*   @version: 30.10.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';

class DetailEditableText extends StatefulWidget {
  @override
  _DetailEditableTextState createState() => _DetailEditableTextState();
}

class _DetailEditableTextState extends State<DetailEditableText> {
  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "Platz für Notizen"; //TODO: get note

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
          style: TextStyle(color: kBlack),
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
    style: TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    ),
    ));
  }
}
