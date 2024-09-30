import 'package:flutter/material.dart';
import 'package:flutter_project/constants/colors.dart';
import 'package:flutter_project/constants/images.dart';
import 'package:flutter_project/screens/home.dart';

class BottomNav extends StatefulWidget {

  const BottomNav({Key? key}) : super(key: key);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  void initState() {
       super.initState();
  }

  final List _children = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(        
        bottomNavigationBar: BottomNavigationBar(
          onTap: (e) {
          
          },
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: const TextStyle(
            backgroundColor: transparentColor
          ),
          selectedItemColor: lightBlue,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                 mailIcon,
                width: 25,
                height: 25,
              ),
              label: 'Mail',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
              chatIcon,
                width: 25,
                height: 25,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                 calenderIcon,
                  width: 25,
                  height: 25,
                ),
                label: 'Calendar'),

            BottomNavigationBarItem(
                icon: Image.asset(
                 settingsIcon,
                  width: 25,
                  height: 25,
                ),
                label: 'Settings')
          ],
        ),
        body: _children[0]);
  }
}
