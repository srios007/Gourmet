import 'package:flutter/material.dart';
import 'package:gourmet/components/catapultaScrollView.dart';
import 'package:gourmet/components/caratula_restaurante.dart';
import 'package:gourmet/components/fade_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/screens/favoritos/restaurante_premium.dart';
import 'package:gourmet/screens/inicio/filtros.dart';

class Buscar extends StatefulWidget {
  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> with SingleTickerProviderStateMixin {

  nextRoute()  {

    Navigator.push(
      context,
      FadeRoute(
          page:  Filtros()
      ),
    );
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
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.21),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.2,
          bottomOpacity: 1,
          backgroundColor: Palette.white,
          centerTitle: true,
          title: Text(
              'YOURMET',
              style: GoogleFonts.poppins(
                textStyle :TextStyle(
                    color: Palette.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2
                ),
              )
          ),
          flexibleSpace: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.066,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.066,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
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
                            width: MediaQuery.of(context).size.width * 0.045,
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
                            width: MediaQuery.of(context).size.width * 0.045,
                          ),
                          Container(
                            width: 1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: Palette.lightGray,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.045,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height:MediaQuery.of(context).size.height * 0.03,
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    child: FittedBox(
                                      child: Text(
                                          'Buscar restaurante',
                                          style: GoogleFonts.poppins(
                                              textStyle: Styles.kOpacity
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.19,
                          ),
                          GestureDetector(
                            onTap: (){
                              nextRoute();
                            },
                            child: IconTheme(
                              data: IconThemeData(
                                color: Palette.gourmet,
                              ),
                              child: ImageIcon(
                                AssetImage(
                                  'imagenes/filtrar.png'
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: Palette.black.withOpacity(0.3),
            labelColor: Palette.gourmet,
            tabs: [
              Tab(
                child: Text(
                    'Free',
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
                    'Standard',
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
                    'Premium',
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
      body: TabBarView(
        children: [
          Scaffold(
            body: CatapultaScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Caratula(
                              title:  'Restaurante Asiatico Kathmandu',
                              calificacion: '4,6',
                              resena:'142',
                              image: 'kathmandu.png',
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Caratula(
                              title:  'Jungla Kumba',
                              calificacion: '4,0',
                              resena:'1546',
                              image: 'junglakumba.png',

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Caratula(
                              title:  'Matildelina La Casa del Vallenato',
                              calificacion: '4,3',
                              resena:'1210',
                              image: 'matildelina.png',

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Caratula(
                              title:  'The Monkey House',
                              calificacion: '4,4',
                              resena:'938',
                              image: 'themonkeyhouse.png',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Caratula(
                              title:  "Full 80's",
                              calificacion: '4,4',
                              resena:'1247',
                              image: 'full80s.png',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Scaffold(
            body: CatapultaScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Caratula(
                            title:  'Gran Inka Gastro Bar',
                            calificacion: '4,5',
                            resena:'184',
                            image: 'granincagastrobar.png',
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Caratula(
                            title:  'Restaurante Peruano El indio de MAchu Picchu',
                            calificacion: '4,8',
                            resena:'483',
                            image: 'peruano.png',

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  'Restaurante Vegetariano El Huerto de Edén',
                            calificacion: '4,7',
                            resena:'109',
                            image: 'elhuertodeleden.png',

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  'Café Restaurante El Gato Gris',
                            calificacion: '4,5',
                            resena:'938',
                            image: 'caferestauranteelgatogris.png',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  "Restaurante Indio Taj Mahal",
                            calificacion: '4,5',
                            resena:'414',
                            image: 'restauranteindiotajmahal.png',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Scaffold(
            body: CatapultaScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                FadeRoute(
                                    page:  Premium()
                                ),
                              );
                            },

                            child: Caratula(
                              title:  'Capitalino Restaurant',
                               calificacion: '4,0',
                              resena:'139',
                              image: 'capitalino.png',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  'Ushin Japanese & Grill',
                            calificacion: '3,9',
                            resena:'303',
                            image: 'ushin.png',

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  'La Ventana',
                            calificacion: '4,6',
                            resena:'722',
                            image: 'laventana.png',

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  'The Market',
                            calificacion: '4,6',
                            resena:'628',
                            image: 'themarket.png',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Caratula(
                            title:  "Pesquera Jaramillo",
                            calificacion: '4,4',
                            resena:'574',
                            image: 'pesquerajaramillo.png',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        controller: _tabController,
      ),
    );
  }
}