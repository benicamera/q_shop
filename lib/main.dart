import 'package:flutter/material.dart';
import 'package:q_shop/constants.dart';
import 'file:///C:/Users/Beni/AndroidStudioProjects/q_shop/lib/screens/main/main_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'qShop!',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kGrey),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
