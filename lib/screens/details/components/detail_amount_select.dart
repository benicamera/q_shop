import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class DetailAmount extends StatefulWidget {
  double amount;
  String unit;

  DetailAmount(String amount) {
    this.amount = double.parse(amount.split(" ")[0]);
    this.unit = amount.split(" ")[1];
  }

  @override
  _DetailAmountState createState() =>
      _DetailAmountState(amount: amount, unit: unit);
}

class _DetailAmountState extends State<DetailAmount> {
  //TODO: Informationen in JSON speichern
  double amount;
  String unit;
  final textController = TextEditingController();

  _DetailAmountState({this.amount, this.unit});

  void validateInput(String input) {
    String _input = input.toString();

    _input = _input.replaceAll('.', '');
    print(_input + " 1");

    _input = _input.replaceAll(',', '.');
    print(_input + " 2");

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
              //controller: textController,
              style: TextStyle(color: kBlack, fontSize: size.height * 0.03),
              initialValue: doubleToText(amount),
              onFieldSubmitted: (String input) {
                print(input);
                validateInput(input);
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