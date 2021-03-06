import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';

class GourmetButton extends StatelessWidget {
  GourmetButton({
    @required this.onPressed,
    this.title,
    this.backgroundColor,
    this.shadowColor,
    this.isLoading = false,
    this.canPush = false,
  });
  String title;
  Color backgroundColor;
  Color shadowColor;
  Function onPressed;
  bool isLoading;
  bool canPush;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 63,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Palette.gourmet,
              width: 2
            ),
            gradient: canPush
                ? LinearGradient(
                    colors: [Palette.gourmet, Palette.gourmet],
                    stops: [0.5, 0.8],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  )
                : LinearGradient(
                    colors: [Colors.white, Colors.white],
                    stops: [1, 1],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
          ),
          child: CupertinoButton(
            child: isLoading
                ? Container(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Palette.white),
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    title ?? "Continuar",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: canPush
                        ? Palette.white
                          :Palette.gourmet
                    ),
                  ),
            onPressed: () {
              if (!isLoading) {
                onPressed();
              }
            },
          ),
        ),
      ],
    );
  }
}
