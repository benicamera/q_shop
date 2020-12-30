import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/longButton.dart';
import 'package:q_shop/models/products.dart';

import '../constants.dart';
import 'appicons_icons.dart';

class ItemManageButton extends StatelessWidget {
  final Product item;

  const ItemManageButton({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          deleteDialog(context);
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width * 0.96,
          decoration: BoxDecoration(
            color: kDarkGrey1,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10),
                  child: Text(
                    item.name,
                    style: TextStyle(
                        fontSize: 22,
                        color:
                            kLightGrey2), //TODO: Icon einfügen und automatic font
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void deleteDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              backgroundColor: kDarkGrey3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(kWidgRadius)),
              ),
              content: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Appicons.X,
                          color: kRed,
                        ),
                        backgroundColor: Color(0000000),
                      ),
                    ),
                  ),
                  Container(color: kDarkGrey3, width: size.width / 2, height:  size.height/ 8,),
                  Padding(
                      padding: EdgeInsets.only(left: 45.0, right: 1.0, top: 25),
                      child: InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                          delete(context);
                        },
                        child: Container(
                          width: size.width / 3,
                          height: size.height / 20,
                          decoration: BoxDecoration(
                            color: kBluGreyS2,
                            borderRadius:
                            BorderRadius.all(Radius.circular(kWidgRadius)),
                          ),
                          child: Center(
                              child: Text('Produkt entgültig löschen',
                                  style: TextStyle(color: kWhite))),
                        ),
                      )),
                ],
              ));
        });
  }
  void delete(context){
    Box box = Hive.box("allProducts");
    box.deleteAt(getIndex(box));
    compact(box, box.length);
    Navigator.of(context).pop();
  }

  int getIndex(Box box){
    for(int i=0; i<box.length; i++){
      if(box.getAt(i).name == item.name)
        return i;
    }
    return -1;
  }

  void compact(Box box, int boxLength) {
    for (int i = 0; i < box.length - 1; i++) {
      if (box.getAt(i) == null) {
        box.putAt(i, box.getAt(i + 1));
        compact(box, boxLength);
        return;
      }
    }
  }
}
