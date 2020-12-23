import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import '../../../models/item_button_widget.dart';
import 'list_widget.dart';

class ListGridView extends StatefulWidget {
  int index;

  ListGridView({this.index});

  @override
  _ListGridView createState() => _ListGridView(index: this.index);
}

class _ListGridView extends State<ListGridView> {
  int index;
  _ListGridView({this.index});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('shopLists');
    print("List index: " + index.toString());
    return GridView.builder(
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      scrollDirection: Axis.vertical,
      primary: false,
      reverse: false,
      shrinkWrap: true,
      itemCount: box.length,
      physics: ScrollPhysics(),
      itemBuilder: (context, int i) {
              bool isSelected = (index == i)? true : false;
              return ListWidget(isSelected: isSelected, list: box.getAt(i));
      },
    );
  }
}