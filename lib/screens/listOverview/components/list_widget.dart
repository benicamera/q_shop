import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/constants.dart';
import 'package:q_shop/models/item_button_widget.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/models/appicons_icons.dart';
import 'package:q_shop/screens/listDetails/listDetails_screen.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  
  _ListWidgetState(this.isSelected, this.list);

  String shortItem(String name) {
    String _name = name;
    if (_name.length > 11) {
      _name = _name.substring(0, 11);
      _name = _name + "...";
      return _name;
    }
    return _name;
  }

  bool nameTaken(String name){
    final Box listBox = Hive.box('shopLists');
    for(int i=0; i < listBox.length; i++){
      if(listBox.getAt(i).name == name)
        return true;
    }
    return false;
  }

  void showAlertDialog(BuildContext context){
    Size size = MediaQuery.of(context).size;
    showDialog(context: context,
      builder: (BuildContext context){
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
                    child: Icon(Appicons.X, color: kRed,),
                    backgroundColor: Color(0000000),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _textEditingController,
                          validator: (value){
                          print(value);
                            if(value.isEmpty){
                              return 'Name kann nicht leer sein.';
                            }
                            if(value.toString()[0] == " "){
                              return 'Name dar nicht mit Leer beginnen';
                            }
                            if(nameTaken(value)){
                              return 'Name bereits vergeben';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Name der Liste', labelStyle: TextStyle(color: kGrey))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkResponse(
                        onTap: () {
                          if(_formKey.currentState.validate() && _textEditingController.text[0] != " "){
                            //TODO: Text speichern und liste erstellen
                            ShopList newList = new ShopList(name: _textEditingController.text, products: [], checked: []);
                            var listBox = Hive.box('shopLists');
                            listBox.add(newList);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          width: size.width / 3,
                          height: size.height / 20,
                          decoration: BoxDecoration(
                            color: kBluGreyS2,
                            borderRadius: BorderRadius.all(Radius.circular(kWidgRadius)),
                          ),
                          child: Center(child: Text('Liste hinzufügen', style: TextStyle(color: kWhite))),
                        ),
                      )
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void openListDetails(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListDetailsScreen(
              list: list,
              selected: isSelected,
            )));
  }

  void switchSelect(){
    //TODO: Select ändern
  }

  @override
  Widget build(BuildContext context) {
    print(list.name + " " + isSelected.toString());
    return GestureDetector(
      onTap: () {(list.name == 'NeW?173')? showAlertDialog(context): openListDetails();},
      onDoubleTap: () {switchSelect();},
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
                    child: (list.name == 'NeW?173')? Icon(Appicons.Plus1, color: kBluGreyS1, size: 50,) : Icon(
                      Appicons.Letters[list.name.toLowerCase()[0]], //TODO: Item icon hinzufügen
                      color: kBluGreyS1,
                      size: 50,
                    )),
            Padding(
              padding:
              EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
              child: AutoSizeText(
                shortItem((list.name == 'NeW?173')?"Neue Liste" : list.name),
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
