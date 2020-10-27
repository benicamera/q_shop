/*  detail_note.dart
*   @author: Benjamin Dangl
*   @version: 27.10.2020
 */

import 'package:flutter/material.dart';
import '../../../constants.dart';

class DetailNote extends StatelessWidget {
  const DetailNote({
    Key key,
    @required this.size,
    @required this.notes,
  }) : super(key: key);

  final Size size;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Padding(
        padding:
        EdgeInsetsDirectional.only(start: 10, end: 10),
        child: Row(
          children: <Widget>[
            Text(
              "Notizen:",
              style: TextStyle(color: kBlack, fontSize: 15),
            ),

            SizedBox(
              height: 2,
              width: size.width *0.6,
            ),
            IconButton(
              icon: Icon(Icons.edit, color: kBlack,),
              iconSize: 15,
              onPressed: (){}, //TODO: open editing mode for text
            )
          ],
        )
    ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: size.width*0.05),
            child: Text(
              notes,
              style: TextStyle(color: kBlack),
            ),
          )
      )],);
  }
}
