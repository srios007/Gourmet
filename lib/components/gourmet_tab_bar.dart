import 'package:flutter/material.dart';
import 'package:gourmet/config/config.dart';

class GourmetTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const GourmetTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.gourmet,
            width: 3,
          ),
        ),
      ),
      labelColor: Palette.gourmet,
      unselectedLabelColor: Palette.black.withOpacity(0.25),
      tabs: icons
          .asMap()
          .map(
            (index, icon) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  color: index == selectedIndex
                      ? Palette.gourmet
                      : Palette.black.withOpacity(0.25),
                  size: 30,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
