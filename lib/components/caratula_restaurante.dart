import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';

class Caratula extends StatelessWidget {
  Caratula({
    @required this.title,
    @required this.calificacion,
    @required this.resena,
    @required this.image,
    this.onPressed

  });
  final String title;
  final String calificacion;
  final String resena;
  final String image;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                    height:  MediaQuery.of(context).size.height * 0.225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),

                    ),
                    child: Image.asset('imagenes/$image',
                      fit: BoxFit.fill,)
                ),
              ),
            ],
          ),

          Container(
            height:  MediaQuery.of(context).size.height * 0.22,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 140, 0),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        textStyle: Styles.kCaratulaStyle
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),

          ),
          Column(
            children: <Widget>[
              SizedBox(
                height:  MediaQuery.of(context).size.height * 0.175,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  IconTheme(
                    data: IconThemeData(
                      color: Palette.yellowDark,
                      size: 18
                    ),
                    child: ImageIcon(
                        AssetImage(
                            'imagenes/estrellas.png'
                        )
                    ),
                  ),
                  Text(
                    calificacion,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Palette.yellowDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                  SizedBox(
                    width: 210,
                  ),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
