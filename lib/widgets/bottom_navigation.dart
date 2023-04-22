import 'package:college_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:college_app/screens/home_screen.dart';
import 'package:college_app/screens/classes_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedTab = 0;
  var _currentPage;
  var _homeScreen;
  var _classesScreen;
  @override
  void initState() {
    super.initState();
    _homeScreen = HomeScreen();
    _classesScreen = ClassesScreen();
    _currentPage = _classesScreen as Widget;
    // _currentPage = _homeScreen as Widget;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: <Widget>[
          _currentPage,
          _bottomNavigator(),
        ],
      ),
    );
  }

  _bottomNavigator() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.background,
          currentIndex: _selectedTab,
          onTap: (int tab) {
            setState(() => {
                  _selectedTab = tab,
                  _selectedTab == 0
                      ? _currentPage = _classesScreen
                      : _currentPage = _homeScreen
                });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/house.svg",
                width: 35.0,
                color: _selectedTab == 0
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
              label: '',
              // label: 'home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/read_book.svg",
                width: 35.0,
                color: _selectedTab == 1
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
              label: '',
              // label: 'read',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/homework.svg",
                width: 35.0,
                color: _selectedTab == 2
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),

              label: '',
              // label: 'homework',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/comment.svg",
                width: 35.0,
                color: _selectedTab == 3
                    ? Theme.of(context).colorScheme.secondary
                    : kTextColor,
              ),
              label: '',
              // label: 'comment',
            ),
          ],
        ),
      ),
    );
  }
}
