/*  addItem_screen.dart
*   @author: Benjamin Dangl
*   @version: 14.11.2020
 */

import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';

class SearchBar extends StatefulWidget {
  Function onChanged;
  SearchBar({this.onChanged});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width * 0.96,
        decoration: BoxDecoration(
          color: kDarkGrey1,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height / 40),
          child: TextFormField(
            style: TextStyle(color: kLightGrey1),
            controller: _controller,
            onChanged: widget.onChanged,
            autocorrect: true,
            cursorColor: kLightGrey3,
            decoration: InputDecoration(
              hintText: 'Suche',
              fillColor: kDarkGrey1,
              focusColor: kLightGrey1,
              icon: Icon(Icons.search, color: kLightGrey1,),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00000000))
              ),

            ),
          ),
        ));
  }
}
