/*  catSelector.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import '../../../constants.dart';

class CatSelector extends StatefulWidget {
  String defCat = "Sonstige";
  CatSelector() {}

  @override
  _CatSelector createState() =>
      _CatSelector(category: defCat);
}

class _CatSelector extends State<CatSelector> {
  //TODO: Informationen in JSON speichern
  String category;
  final textController = TextEditingController();

  _CatSelector({this.category});

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