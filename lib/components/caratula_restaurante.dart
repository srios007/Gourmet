import 'package:flutter/material.dart';
import 'package:gourmet/config/constantes.dart';
import 'package:google_fonts/google_fonts.dart';

class Caratula extends StatelessWidget {
  Caratula({
    @required this.title,
    @required this.calificacion,
    @required this.resena,
    @required this.image,

  });
  final String title;
  final String calificacion;
  final String resena;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    borderRadius: kRadiusAll,

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
                      textStyle: kCaratulaStyle
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
                    color: kYellowColor,
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
                      color: kYellowColor,
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
        Column(
          children: <Widget>[
            SizedBox(
              height:  MediaQuery.of(context).size.height * 0.175,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: Text(
                      '$resena reseñas',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: kWhiteColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w200
                        ),
                      )
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
