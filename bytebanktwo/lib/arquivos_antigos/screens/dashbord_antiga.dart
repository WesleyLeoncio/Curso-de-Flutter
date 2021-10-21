import 'package:bytebanktwo/arquivos_antigos/components/feature_item.dart';
import 'package:bytebanktwo/routess/app_routes.dart';
import 'package:flutter/material.dart';
//TODO DASHBORD ANTIGA
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                FeatureItem(
                  'Transferir',
                  Icons.monetization_on,
                  onClick: (){
                    Navigator.of(context).pushNamed(AppRoutes.contactList);
                  },
                ),
                FeatureItem(
                  'Transaction Feed',
                  Icons.description,
                  onClick: (){
                    Navigator.of(context).pushNamed(AppRoutes.contacTransactionFeed);
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
