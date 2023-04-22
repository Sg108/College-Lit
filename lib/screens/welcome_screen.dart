import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:college_bytes/pages/isauth.dart';
import 'package:college_bytes/constants.dart';
import 'package:college_bytes/widgets/bottom_navigation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      // appBar: AppBar(
      //   title: Text('College Bytes'),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60.0),
                    bottomRight: Radius.circular(60.0),
                  ),
                  color: Theme.of(context).colorScheme.background),
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 200.0,
              left: 100.0,
              right: 100.0,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    child: SvgPicture.asset(
                      "assets/icons/grad_cap.png",
                      height: 180.0,
                      width: 180.0,
                    ),
                  ),
                  const Text(
                    "College Bytes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 170.0,
              left: 50.0,
              right: 50.0,
              child: Column(
                children: const <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Now, You won't miss any critical events and classes indeliberately",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height - 130,
                left: 100.0,
                right: 100.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => IsAuth()),
                    );
                  },
                  child: Container(
                      width: 150.0,
                      height: 55.0,
                      padding: EdgeInsets.only(left: 40.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Row(
                        children: const <Widget>[
                          Text(
                            "GET STARTED",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 28.0,
                          )
                        ],
                      )),
                ))
          ],
          // clipBehavior: Clip.none,
        ),
      ),
    );
  }
}
