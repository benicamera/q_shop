import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/details/details_screen.dart';

import '../../../constants.dart';

class ProposalView extends StatefulWidget {
  final list;
  final index;
  final Function callBack;

  const ProposalView({Key key, this.list, this.index, this.callBack})
      : super(key: key);

  @override
  _ProposalViewState createState() =>
      _ProposalViewState(this.list, this.index, this.callBack);
}

class _ProposalViewState extends State<ProposalView> {
  final list;
  final index;
  final Function callBack;

  _ProposalViewState(this.list, this.index, this.callBack);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: list.length,
        itemBuilder: (context, int i) {
          return ProposalWidget(
            index: index,
            callBack: callBack,
            product: list[i],
          );
        });
  }
}

class ProposalWidget extends StatelessWidget {
  final index;
  final Function callBack;
  final product;

  const ProposalWidget({Key key, this.index, this.callBack, this.product})
      : super(key: key);

  void toDetailScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsScreen(
                product: ListProduct(
                    name: product.name,
                    icon: product.icon,
                    cat: product.cat,
                    amount: "2 kg",
                    note: "Platz für Notizen"),
                index: index,
                add: true,
                callBack: callBack)));
  }

  String displayableAmount(String amount){
    String _amount = amount.split(" ")[0];
    String _unit = amount.split(" ")[1];
    _amount = _amount.replaceAll(".", ",");
    String out = _amount + " " + _unit;
    return out;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("ItemButton tapped");
          toDetailScreen(context);
        },
        child: Container(
          child: new Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              ProposalWidgetRoot(
                itemName: product.name,
                itemIcon: product.icon,
              ),
            ],
          ),
        ));
  }
}

class ProposalWidgetRoot extends StatelessWidget {
  final itemName;
  final IconData itemIcon;
  final int itemId = 1; //TODO: get ItemId

  ProposalWidgetRoot({this.itemName, this.itemIcon});

  String shortItem(String name) {
    String _name = name;
    if (_name.length > 11) {
      _name = _name.substring(0, 11);
      _name = _name + "...";
      return _name;
    }
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  child: Hero(
                      tag: (itemName + "1"),
                      child: Icon(
                        itemIcon,
                        color: kBluGreyS1,
                        size: 50,
                      ))),
              Padding(
                padding:
                EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                child: AutoSizeText(
                  shortItem(itemName),
                  style: TextStyle(color: kWhite),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ));
  }
}

