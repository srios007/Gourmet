import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/screens/favoritos/restaurante_premium.dart';
import 'package:gourmet/components/fade_route.dart';
import 'package:gourmet/config/constantes.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  nextRoute()  {

    Navigator.push(
      context,
      FadeRoute(
          page:  Premium()
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: Text(
          'Favoritos',
          style: kTituloRegistrarUsuario,
        ),
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height:40,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    'Restaurante Premium',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: kBlackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: (){
                  nextRoute();
                },child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 143,
                              decoration: BoxDecoration(
                                borderRadius: kRadiusAll,
                              ),
                              child: Image.asset('imagenes/capitalino.png',
                                fit: BoxFit.fill,)
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 143,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 140, 0),
                          child: Text(
                            'Capitalino Restaurant',
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
                        height: 110,
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
                              '4,0',
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
                        height: 110,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                              '139 reseñas',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200
                                ),
                              )
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
