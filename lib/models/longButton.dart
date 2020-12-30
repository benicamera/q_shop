import 'package:flutter/material.dart';
import '../constants.dart';

class LongButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final Function onTap;
  final double fontSize;
  const LongButton({Key key, this.text, this.onTap, this.height, this.width, this.fontSize}) : super(key: key);
  @override
  _LongButtonState createState() => _LongButtonState(text, onTap, height, width, fontSize);
}

class _LongButtonState extends State<LongButton> {
  final String text;
  final Function onTap;
  final double height;
  final double width;
  final double fontSize;

  _LongButtonState(this.text, this.onTap, this.height, this.width, this.fontSize);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkResponse(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: kBluGreyS2,
          borderRadius:
          BorderRadius.all(Radius.circular(kWidgRadius)),
        ),
        child: Center(
            child: Text(text,
                style: TextStyle(color: kWhite, fontSize: fontSize))),
      ),
    );
  }
}