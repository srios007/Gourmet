import 'package:gourmet/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatapultaOptionRow extends StatelessWidget {
  CatapultaOptionRow({
    @required this.text,
    this.onTap,
    this.iconData,
  });

  String text;
  Function onTap;
  var iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Row(
          children: <Widget>[
            iconData == null
                ? const SizedBox.shrink()
                : Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                iconData,
                size: 24,
                color: Palette.gourmet.withOpacity(0.85),
              ),
            ),
            Container(
              color: Palette.white,
              height: 50,
              child: Center(
                child: Text(
                  '$text',
                  style: Styles.configLbl,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Palette.white,
                height: 50,
              ),
            ),
            Container(
              height: 50,
              color: Palette.white,
              child: Icon(
                Icons.chevron_right,
                color: Palette.black.withOpacity(0.25),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
