import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RecommendedScreen extends StatelessWidget {
  RecommendedScreen();
  static const routeName = '/recommended';

  @override
  Widget build(BuildContext context) {
    List<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    print(args);
    print(args.runtimeType);
    return Scaffold(
        appBar: AppBar(
          title: Text('View Recommendations'),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 0, 10.0),
            width: MediaQuery.of(context).size.width,
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recommendation Order - ",
                    style: TextStyle(color: Colors.white, fontSize: 26.0)),
                SizedBox(height: 15.0),
                Text('( from highest to lowest )',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                SizedBox(
                  height: 30,
                ),
                ...args.map(
                  (rec) => Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        Text(
                          rec,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                )
              ], //
            )));
  }
}
