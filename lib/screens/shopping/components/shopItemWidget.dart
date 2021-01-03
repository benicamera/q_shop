import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';

import '../../../constants.dart';

class ShopItemWidget extends StatefulWidget {
  final ListProduct product;
  final ShopList list;
  final Function onCheck;

  const ShopItemWidget({Key key, this.product, this.list, this.onCheck})
      : super(key: key);

  @override
  _ShopItemWidgetState createState() =>
      _ShopItemWidgetState(product, list, onCheck);
}

class _ShopItemWidgetState extends State<ShopItemWidget> {
  final ListProduct product;
  final ShopList list;
  final Function onCheck;

  _ShopItemWidgetState(this.product, this.list, this.onCheck);

  int getProdIndex() {
    for (int i = 0; i < list.products.length; i++) {
      if (list.products[i].name == product.name) return i;
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.name),
      background: buildCheckMark(),
      onDismissed: onCheck,
      direction: DismissDirection.endToStart,
      child: Card(
        color: kBluGreyS3,
        elevation: 5,
        child: ShopItemOverlay(product: product),
      ),
    );
  }

  Container buildCheckMark() {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      color: kGreenS1,
      child: Icon(
        Icons.check,
        size: 100,
        color: kWhite,
      ),
    );
  }
}

class ShopItemOverlay extends StatelessWidget {
  const ShopItemOverlay({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ListProduct product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width.toString() + " x " + size.height.toString());
    return Container(
      height: size.height / 5,
      width: size.width / 1,
      child: Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 20),
              child: Column(
                children: <Widget>[
                  Icon(
                    product.icon,
                    color: kBluGreyS1,
                    size: size.height / 7.5,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(color: kBluGreyS1, fontSize: 30),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.amount,
                    style: TextStyle(fontSize: (30*(size.height/650)), fontWeight: FontWeight.bold, color: kBluGreyS1),
                  ),
                ),
                Container(
                  width: size.width / 2,
                  height: size.height / 8,
                  child: Text(
                    shortNote(product.note, context),
                    style: TextStyle(color: kWhite),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 0),
            child: Icon(
              Icons.arrow_back_ios,
              color: kGreenH1,
            ),
          )
        ],
      ),
    );
  }

  String shortNote(String note, BuildContext context) {
    print("shortNote");
    Size size = MediaQuery.of(context).size;
    int charNum = ((size.width - 10) ~/ 10);
    charNum *= size.height ~/ 230;
    if (charNum < note.length) {
      print(charNum.toString() + " < " + note.length.toString());
      String _note = note.substring(0, charNum - 3) + "...";
      print(_note);
      return _note;
    }
    return note;
  }
}
