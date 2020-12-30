import 'package:flutter/material.dart';
import 'package:q_shop/models/longButton.dart';
import 'package:q_shop/screens/manageProducts/manageProducts_screen.dart';

class Settings_Body extends StatefulWidget {
  @override
  _Settings_BodyState createState() => _Settings_BodyState();
}

class _Settings_BodyState extends State<Settings_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          width: size.width / 1.5,
          height: size.height / 9,
        ),
        Center(
            child: LongButton(
          height: size.height / 9,
          width: size.width / 1.5,
          text: "Produkte verwalten",
          fontSize: 20,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ManageProducts_Screen()));
          },
        )),
      ],
    );
  }
}
