import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/item_button_widget.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/models/appicons_icons.dart';

class ListWidget extends StatefulWidget {
  final bool isSelected;
  final ShopList list;

  const ListWidget({Key key, this.isSelected, this.list}) : super(key: key);
  @override
  _ListWidgetState createState() => _ListWidgetState(isSelected, list);
}

class _ListWidgetState extends State<ListWidget> {
  final bool isSelected;
  final ShopList list;

  _ListWidgetState(this.isSelected, this.list);

  /*@override
  Widget build(BuildContext context) {
    print(list.name + " " + isSelected.toString());
    return GestureDetector(
      onTap: () {print("ListTap");},
      child: Card(
        borderOnForeground: isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kWidgRadius)),
        side: BorderSide(color: isSelected? kBlue : Color(0x00000000))), // 0x00000000 = durchsichtig
        child: Container(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.height / 10,
          color: kBluGreyS3,
          child: Icon(Appicons.Letters[list.name.toLowerCase()[0]], color: kWhite,),
        ),
      ),
    );
  }*/
  String shortItem(String name) {
    String _name = name;
    if (_name.length > 11) {
      _name = _name.substring(0, 11);
      _name = _name + "...";
      return _name;
    }
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    print(list.name + " " + isSelected.toString());
    return GestureDetector(
      onTap: () {print("ListTap");},
      child: Padding(
        padding:  EdgeInsets.all(kDefPadding / 2),
        child: Card(
          color: isSelected? kBluGreyS1: kBluGreyS3,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kWidgRadius)),
          ),
          child: buildWidget(),
        ),
        ),

    );
  }

  Padding buildWidget() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Card(
      color: kBluGreyS3,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kWidgRadius))),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    left: kDefPadding / 2,
                    right: kDefPadding / 2,
                    top: kDefPadding / 2),
                    child: Icon(
                      Appicons.Letters[list.name.toLowerCase()[0]], //TODO: Item icon hinzufügen
                      color: kBluGreyS1,
                      size: 50,
                    )),
            Padding(
              padding:
              EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
              child: AutoSizeText(
                shortItem(list.name),
                style: TextStyle(color: kWhite),
                maxLines: 1,
              ),
            )
          ],
        ),
      )
  )
  );
  }
}
