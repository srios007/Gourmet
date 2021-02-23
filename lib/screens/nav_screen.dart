import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/screens/screens.dart';

class NavScreen extends StatefulWidget {
  NavScreen({this.index = 0});
  int index;

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    Perfil(),
  ];

  final List<IconData> _icons = const [
    Icons.search,
    Icons.favorite,
    Icons.account_circle,
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
        initialIndex: widget.index,
        length: _icons.length,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: _screens,
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              color: Palette.white,
              border:
              Border(top: BorderSide(color: Palette.black.withOpacity(0.15))),
            ),
            child: GourmetTabBar(
              icons: _icons,
              selectedIndex: widget.index,
              onTap: (index) {
                setState(() {
                  widget.index = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}