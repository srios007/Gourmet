import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/screens/favoritos/favoritos.dart';
import 'package:gourmet/components/catapultaScrollView.dart';
import 'package:gourmet/screens/inicio/inicio.dart';
import 'package:gourmet/screens/perfil/perfil.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Buscar(),
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

          backgroundColor: Palette.white  ,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('imagenes/busqueda.png')),
              title: Text(""),
              activeIcon: ImageIcon (AssetImage('imagenes/busquedal.png'))
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('imagenes/favoritos.png')),
              activeIcon: ImageIcon (AssetImage('imagenes/favoritol.png')),
              title: Text(""),


            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('imagenes/perfil.png')),
              activeIcon: ImageIcon (AssetImage('imagenes/perfill.png')),
              title: Text(""),

            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:Palette.gourmet,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


