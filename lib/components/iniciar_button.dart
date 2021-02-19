import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/constantes.dart';

class IniciarButton extends StatelessWidget {
  IniciarButton({
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
              color: Colors.white,
              width: 2
            ),
            gradient: canPush
                ? LinearGradient(
                    colors: [Colors.white, Colors.white],
                    stops: [0.5, 0.8],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  )
                : LinearGradient(
                    colors: [Colors.transparent, Colors.transparent],
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
                      valueColor: AlwaysStoppedAnimation<Color>(kLabelColor),
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    title ?? "Continuar",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: canPush
                        ?kLabelColor
                        :Colors.white
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
