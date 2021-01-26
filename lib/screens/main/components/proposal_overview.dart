import 'package:flutter/material.dart';
import 'package:q_shop/models/api.dart';
import 'package:q_shop/models/products.dart';
import 'package:q_shop/screens/main/components/proposalview.dart';

class ProposalOverview extends StatefulWidget {
  final index;

  const ProposalOverview({Key key, this.index}) : super(key: key);
  @override
  _ProposalOverviewState createState() => _ProposalOverviewState(index);
}

class _ProposalOverviewState extends State<ProposalOverview> {
  List<Product> proposals = [];
  final index;

  _ProposalOverviewState(this.index);

  Future<void> getCall() async {
    proposals = await getProposals();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCall(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError){
            print(snapshot.data);
            return Text(snapshot.error.toString());
          }
          if(proposals.isNotEmpty)
            return ProposalView(list: proposals, index: index, callBack: (){},);
          return Text("Es konnten noch keine Vorschläge generiert werden...");
        }
        return Center(
            child: SizedBox(
          child: CircularProgressIndicator(),
          width: 60,
          height: 60,
        )
        );
      },
    );
  }
}
