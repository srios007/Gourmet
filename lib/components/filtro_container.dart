import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';

class ContainerFiltro extends StatelessWidget {
  ContainerFiltro({
  @required this.title,
  @required this.subtitle,
  @required this.menu,
  @required this.filter1,
  @required this.filter2,
  @required this.filter3,
  @required this.height,

  });
  final String title;
  final String subtitle;
  final String menu;
  final String filter1;
  final String filter2;
  final String filter3;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0125,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: Styles.kTitlePerfil
                    )
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        textStyle: Styles.kSubTitlePerfil
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              Column(
                children: <Widget>[

                  Container(
                    color: Palette.white,
                    width: MediaQuery.of(context).size.width * 0.97,
                    height: MediaQuery.of(context).size.height * 0.066,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.066,
                          width: MediaQuery.of(context).size.width * 0.97,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Palette.lightGray,
                                  blurRadius: 3.0,
                                  offset: Offset(0.2, 0.7)
                              )
                            ],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.06,
                              ),
                              IconTheme(
                                data: IconThemeData(
                                  color: Palette.black.withOpacity(0.3),
                                ),
                                child: ImageIcon(
                                    AssetImage(
                                        'imagenes/busqueda.png'
                                    )
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.06,
                              ),
                              Container(
                                width: 1,
                                height: MediaQuery.of(context).size.height * 0.05,
                                color: Palette.lightGray,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.06,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                          menu,
                                          style: GoogleFonts.poppins(
                                              textStyle: Styles.kOpacity
                                          )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.019,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    'Filtros rápidos',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Palette.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.015,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Palette.lightGray,
                                  blurRadius: 3.0,
                                  offset: Offset(0.2, 0.7)
                              )
                            ],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    filter1,
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kLabelTextStyle2
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.46,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Palette.lightGray,
                                  blurRadius: 3.0,
                                  offset: Offset(0.2, 0.7)
                              )
                            ],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    filter2,
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kLabelTextStyle2
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.36,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Palette.lightGray,
                                  blurRadius: 3.0,
                                  offset: Offset(0.2, 0.7)
                              )
                            ],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    filter3,
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kLabelTextStyle2
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage('imagenes/agregar.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: height,
                    color: Palette.black.withOpacity(0.05),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}