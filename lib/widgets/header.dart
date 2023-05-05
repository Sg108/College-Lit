import 'package:college_bytes/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import '../models/student_provider.dart';
import '../screens/update_profile_screen.dart';

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
<<<<<<< HEAD
          textAlign: TextAlign.center,
        ),
        trailing: GestureDetector(
          child: CircleAvatar(
            radius: 25.0,
            backgroundImage:
                NetworkImage('${Provider.of<Student>(context).pic}'),
            //fit: BoxFit.contain
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UpdateProfileScreen()),
            );
          },
        ),
      ),
=======
          title: const Text(
            'My College',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: TextButton(
            onPressed: () => {
              Navigator.of(context).pushNamed(UpdateProfileScreen.routeName)
            },
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage:
                  NetworkImage('${Provider.of<Student>(context).pic}'),

              //fit: BoxFit.contain
            ),
          )),
>>>>>>> 1c72e39eb2de3925bb0f54ced381d00bcb084b79
    );
  }
}
