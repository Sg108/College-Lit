import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: SvgPicture.asset(
          "assets/icons/grad_cap.png",
          height: 70.0,
        ),
        title: const Text(
          'My College',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
        ),
      ),
    );
  }
}
