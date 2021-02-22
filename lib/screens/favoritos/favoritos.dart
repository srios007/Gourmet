import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/screens/screens.dart';
import 'package:gourmet/components/fade_route.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> with AutomaticKeepAliveClientMixin<Favoritos>{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.white,
        centerTitle: true,
        title: Text(
          'Favoritos',
          style: Styles.kTituloRegistrarUsuario,
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
                        color: Palette.black,
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
                  ///
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
                                borderRadius: BorderRadius.circular(14),
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
                        height: 110,
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
                              '4,0',
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
                                    color: Palette.white,
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
