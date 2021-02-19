import 'package:flutter/material.dart';

import 'package:gourmet/config/constantes.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerPerfil extends StatelessWidget {

  ContainerPerfil({
    @required this.principal,
    @required this.title,
    @required this.imagen,
  });


  final String principal;
  final String title;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.13,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              Text(
                principal,
                style: GoogleFonts.poppins(
                    textStyle: kLabelRegistrar
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: kWhiteColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: kDividerColor,
                  blurRadius: 3.0,
                  offset: Offset(0.2, 0.7)
                )
              ],
              borderRadius: kRadiusAll,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                IconTheme(
                  data: IconThemeData(
                    color: kLabelColor,
                  ),
                  child: ImageIcon(
                    AssetImage(
                      imagen
                    )
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Container(
                  width: 1,
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: kDividerColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: kWhiteColor),
                        borderRadius: kRadiusAll,
                        color: kWhiteColor
                      ),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.01, 0, MediaQuery.of(context).size.height * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                    textStyle: kLabelPerfil
                                  )
                                ),
                              ],
                            )
                          ],
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}