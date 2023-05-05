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
        body: Center(
            child: Column(
          children: [
            Text("Recommendation Order"),
            SizedBox(
              height: 20,
            ),
            ...args.map((rec) => Text(rec))
          ], //
        )));
  }
}
