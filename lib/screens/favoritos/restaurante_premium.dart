import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/components/catapultaScrollView.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/screens/home_screen.dart';
import 'package:gourmet/components/fade_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_pro/carousel_pro.dart';


class Premium extends StatefulWidget {
  @override
  _PremiumState createState() => _PremiumState();
}

class _PremiumState extends State<Premium> with SingleTickerProviderStateMixin {

  nextRoute()  {
    Navigator.push(
      context,
      FadeRoute(
          page:  HomeScreen()
      ),
    );
  }
  String resena = 'Excelente comida, buen servicio.';
  nextLabel(){
    setState(() {
      resena = 'Buena comida, buen servicio.';
    });
  }
  backLabel(){
    setState(() {
      resena = 'Excelente comida, buen servicio.';
    });
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((MediaQuery.of(context).size.height * 0.4) ),
        child: AppBar(
          elevation: 0.2,
          bottomOpacity: 1,
          automaticallyImplyLeading: false,
          backgroundColor: Palette.white,
          centerTitle: true,
          title: Stack(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Restaurante Premium',
                    style: GoogleFonts.poppins(
                        textStyle: Styles.kTituloPremium
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 15,
                        child: GestureDetector(
                            onTap: (){
                              nextRoute();
                            },
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'imagenes/volver.png'
                              ),
                            )
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.35) - kToolbarHeight,
                  width: 375.0,
                  child: Carousel(
                    images: [
                      AssetImage('imagenes/capitalino1.png'),
                      AssetImage('imagenes/capitalino2.png'),
                      AssetImage('imagenes/capitalino3.png'),
                    ],
                    autoplayDuration: Duration(seconds:0),
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Palette.white,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                    dotIncreasedColor: Palette.gourmet,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                    autoplay: false,
                    boxFit: BoxFit.fill,
                  )
                ),
              ],
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Palette.black.withOpacity(0.3),
            labelColor: Palette.gourmet,
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                      child: Text(
                        'Información',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Text(
                  'Menú',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
              Tab(
                child: Text(
                  'Reseñas',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ),
            ],
            controller: _tabController,
            indicatorColor: Palette.gourmet,
            indicatorSize: TabBarIndicatorSize.tab,),
        ),
      ),
      body: Stack(
        children: <Widget>[
          TabBarView(
            children: [
              Scaffold(
                body: CatapultaScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: Palette.white,
                        child: Column(

                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Horario de apertura',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Abierto todos los días',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle2
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Cómo llegar al restaurante',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Calle 24a #57-60',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle2
                                    )
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Indicaciones para llegar al lugar',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'TEUSAQUILLO',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle2
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: CatapultaScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: Palette.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Recomendaciones del chef',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Margarita',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle2
                                    )
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '\$36.000',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle2
                                    )
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Precio promedio',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 105),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '\$60.000',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle2
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'Ver menús a la carta y menús fijos',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Palette.gourmet,
                                    fontSize: 15
                                  )
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: CatapultaScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        color: Palette.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: FittedBox(
                                          child: Text(
                                            '4.0',
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Palette.gourmet,
                                                fontSize: 60,
                                                fontWeight: FontWeight.bold
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          'de 5',
                                          style: GoogleFonts.poppins(
                                            textStyle: Styles.kPremiumStyle3
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.17,
                                          width: MediaQuery.of(context).size.width * 0.72,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(30, 0, 10, 13),
                                                        child: Text(
                                                          'Comida',
                                                          style: GoogleFonts.poppins(
                                                            textStyle: Styles.kPremiumStyle3
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(30, 0, 10, 13),
                                                        child: Text(
                                                          'Servicio',
                                                          style: GoogleFonts.poppins(
                                                            textStyle: Styles.kPremiumStyle3
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                                                        child: Text(
                                                          'Ambiente',
                                                          style: GoogleFonts.poppins(
                                                            textStyle: Styles.kPremiumStyle3
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: <Widget>[
                                                              Container(
                                                                height: 4,
                                                                
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: <Widget>[
                                                                    Image(
                                                                      image: AssetImage(
                                                                        'imagenes/barra1.png',
                                                                      ),
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: <Widget>[
                                                              Container(
                                                                height: 4,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: <Widget>[
                                                                    Image(
                                                                      image: AssetImage(
                                                                        'imagenes/barra2.png',
                                                                      ),
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: <Widget>[
                                                              Container(
                                                                height: 5,
                                                                
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: <Widget>[
                                                                    Image(
                                                                      image: AssetImage(
                                                                        'imagenes/barra3.png',
                                                                      ),
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  child: Text(
                                    '139 reseñas',
                                    style: GoogleFonts.poppins(
                                        textStyle: Styles.kPremiumStyle3
                                    )
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: (){
                                nextLabel();
                              },
                              child: Container(
                                color: Palette.white,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    height: 56,
                                    width: 359,
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
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(20, 15, 100, 0),
                                              child: Text(
                                                'Héctor L.',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold
                                                  )
                                                )
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                              child: Text(
                                                'Hace tres horas',
                                                style: GoogleFonts.poppins(
                                                  textStyle: Styles.kPremiumStyle3
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                              child: IconTheme(
                                                data: IconThemeData(
                                                  color: Palette.yellowLight,
                                                  size: 18
                                                ),
                                                child: ImageIcon(
                                                  AssetImage(
                                                    'imagenes/estrellas.png'
                                                  )
                                                ),
                                              ),
                                            ),
                                            IconTheme(
                                              data: IconThemeData(
                                                color: Palette.yellowLight,
                                                size: 18
                                              ),
                                              child: ImageIcon(
                                                AssetImage(
                                                  'imagenes/estrellas.png'
                                                )
                                              ),
                                            ),
                                            IconTheme(
                                              data: IconThemeData(
                                                  color: Palette.yellowLight,
                                                size: 18
                                              ),
                                              child: ImageIcon(
                                                AssetImage(
                                                  'imagenes/estrellas.png'
                                                )
                                              ),
                                            ),
                                            IconTheme(
                                              data: IconThemeData(
                                                  color: Palette.yellowLight,
                                                size: 18
                                              ),
                                              child: ImageIcon(
                                                AssetImage(
                                                  'imagenes/estrellas.png'
                                                )
                                              ),
                                            ),
                                            IconTheme(
                                              data: IconThemeData(
                                                  color: Palette.yellowLight,
                                                size: 18
                                              ),
                                              child: ImageIcon(
                                                AssetImage(
                                                  'imagenes/estrellas.png'
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                              child: Text(
                                                resena,
                                                style: GoogleFonts.poppins(
                                                  textStyle: Styles.kPremiumStyle2
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            controller: _tabController,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Palette.white,
                  child: Center(
                    child: Container(
                      width: 296,
                      height: 63,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Palette.gourmet
                      ),
                      child: Center(
                        child: Text(
                          "Reservar",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Palette.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                            )
                          )
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}