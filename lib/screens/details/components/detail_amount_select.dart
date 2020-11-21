/*  detail_amount_select.dart
*   @author: Benjamin Dangl
*   @version: 15.11.2020
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:q_shop/models/products.dart';
import '../../../constants.dart';

class DetailAmount extends StatefulWidget {
  double amount;
  String unit;
  final int index;
  final String name;

  DetailAmount(String amount, this.index, this.name) {
    this.amount = double.parse(amount.split(" ")[0]);
    this.unit = amount.split(" ")[1];
  }

  @override
  _DetailAmountState createState() =>
      _DetailAmountState(amount: amount, unit: unit, name: this.name, index: this.index);
}

class _DetailAmountState extends State<DetailAmount> {
  //TODO: Informationen in JSON speichern
  double amount;
  String unit;
  final int index;
  final String name;
  final textController = TextEditingController();

  _DetailAmountState({this.index, this.name, this.amount, this.unit});

  void validateInput(String input) {
    String _input = input.toString();

    _input = _input.replaceAll('.', '');

    _input = _input.replaceAll(',', '.');

    try {
      amount = double.parse(_input);
    } catch (on) {}
    print(amount);
  }

  String doubleToText(double num) {
    String _num = num.toString();

    _num = _num.replaceAll('.', ',');

    return _num;
  }

  void save(){
    print("saving.. Getting box");
    var box = Hive.box('shopLists');
    print("Getting List out of Box at index " + index.toString());
    ShopList currList = box.getAt(index);
    print("Recieved List. Searching for Index of $name...");
    int prodIndex = getProdIndex(currList);
    print("Found i = $prodIndex. Saving amount ${amount.toString() + " " + unit} in object");
    currList.products[prodIndex].amount = amount.toString() + " " + unit;
    print("refreshing storage");
    Hive.box('shopLists').putAt(index, currList);
    print("saved");
  }

  int getProdIndex(ShopList currList){
    List<ListProduct> prodList = currList.products;
    print("--Objects to search from: $prodList");
    for(int i = 0; i < prodList.length; i++){
      if(prodList[i].name == name)
        return i;
    }
    return null;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        SizedBox(
            height: 40,
            width: size.width * 0.2,
            child: TextFormField(
              maxLength: 6,
              style: TextStyle(color: kBlack, fontSize: size.height * 0.03),
              initialValue: doubleToText(amount),
              onFieldSubmitted: (String input) {
                print(input);
                validateInput(input);
                save();
              },
              decoration: InputDecoration(
                //errorText: validateInput(textController.text),
                  border: OutlineInputBorder(),
                  focusColor: kBluGreyS3,
                  fillColor: kWhite,
                  hoverColor: kWhite),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: <TextInputFormatter>[],
            )),
        SizedBox(
          height: 40,
          width: size.width * 0.02,
        ),
        DropdownButton<String>(
          value: unit,
          elevation: 10,
          dropdownColor: kWhite,
          style: TextStyle(color: kBlack),
          underline: Container(
            height: 1,
            color: kDarkGrey1,
          ),
          onChanged: (String newValue) {
            setState(() {
              unit = newValue;
              save();
            });
          },
          items: <String>['kg', 'gr', 'Stk.', 'l', 'ml']
              .map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}