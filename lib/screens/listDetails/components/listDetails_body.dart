import 'package:flutter/material.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/models/publicFunctions.dart';
import 'package:q_shop/screens/listDetails/components/listDetails_editable_name.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class ListDetailsBody extends StatelessWidget {
  final ShopList list;
  final bool selected;
  ListDetailsBody({Key key, this.list, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Detail " + list.name + " " + selected.toString());
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 5,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
              width: MediaQuery.of(context).size.width / 20,
            ),
            Text(
              "Name: ",
              style: TextStyle(
                  color: kLightGrey2,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.6,
              child: EditableListName(
                list: list,
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
          width: MediaQuery.of(context).size.width / 5,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.1,
            ),
            Center(
              child: InkResponse(
                onTap: () {
                  //TODO: Selecten
                  (!selected) ? select(context) : print("blocked");
                },
                child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(kWidgRadius)),
                        color: (!selected) ? kBluGreyS2 : kDarkGrey1),
                    child: Center(
                      child: Text(
                        "Auswählen",
                        style: TextStyle(color: (!selected) ? kWhite : kGrey),
                      ),
                    )),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 20,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.1,
            ),
            Center(
              child: InkResponse(
                onTap: () {
                  if(list.name != 'Liste')
                    delete1(context);
                },
                child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(kWidgRadius)),
                        color: (list.name != 'Liste')? kBluGreyS2: kDarkGrey1),
                    child: Center(
                      child: Text(
                        "Löschen",
                        style: TextStyle(color: (list.name != 'Liste')?kWhite : kGrey),
                      ),
                    )),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.1,
            ),
            Center(
              child: InkResponse(
                onTap: () {
                  checkedWiederherstellen();
                },
                child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(kWidgRadius)),
                        color: kBluGreyS2),
                    child: Center(
                      child: Text(
                        "Abgehakt wiederherstellen",
                        style: TextStyle(color: kWhite),
                      ),
                    )),
              ),
            )
          ],
        )
      ],
    );
  }

  void checkedWiederherstellen(){
    PublicFunctions.restoreChecked('Schau in der Methode', 0);
  }

  void select(BuildContext context){
    print("select");
    final box = Hive.box("shopLists");
    changeSelectIndex(getIndex(box));
    Navigator.of(context).pop();
  }

  void delete1(BuildContext context) {
    print("Delete Start");
    final box = Hive.box("shopLists");
    var index = getIndex(box);
    acceptDelete(context, box, index);
  }

  void delete2(BuildContext context, Box box, int index){
    print("accepted");
    box.deleteAt(index);
    compact(box, box.length);
    changeSelectIndex(0);
    Navigator.of(context).pop();
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

  void acceptDelete(BuildContext context, Box box, int index) {
    print("Accept Delete Start");
    Size size = MediaQuery.of(context).size;
    print("Before showDialog");
    showDialog(
        context: context,
        builder: (_) {
          print("Builder");
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
                          delete2(context, box, index);
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
                              child: Text('Liste löschen',
                                  style: TextStyle(color: kWhite))),
                        ),
                      )),
                ],
              ));
        });
  }

  void changeSelectIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("currentListIndex", index);
  }

  int getIndex(Box box) {
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i).name == list.name) return i;
    }
    return -1;
  }
}





