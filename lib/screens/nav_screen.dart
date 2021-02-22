import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/screens/screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Favoritos(),
    Perfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: CatapultaScrollView(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Palette.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Palette.darkGrey,
                size: 30,
              ),
              title: Text(""),
              activeIcon: Icon(
                Icons.search,
                color: Palette.gourmet,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Palette.darkGrey,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: Palette.gourmet,
                size: 30,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Palette.darkGrey,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: Palette.gourmet,
                size: 30,
              ),
              title: Text(""),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Palette.gourmet,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
