import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/screens/home_screen.dart';
import 'package:gourmet/components/filtro_container.dart';
import 'package:gourmet/components/fade_route.dart';
import 'package:gourmet/components/catapultaScrollView.dart';


class Filtros extends StatefulWidget {
  @override
  _FiltrosState createState() => _FiltrosState();
}

class _FiltrosState extends State<Filtros> {

  nextRoute()  {

    Navigator.push(
      context,
      FadeRoute(
          page:  HomeScreen()
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.white,
        centerTitle: true,
        title: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Filtros',
                  style: Styles.kTituloRegistrarUsuario,
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
        elevation: 0.5,
      ),
      body: CatapultaScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          width: MediaQuery.of(context).size.width,
          color: Palette.white,
          child: Column(
            children: <Widget>[
              ContainerFiltro(
                title: 'Tipos de comida',
                subtitle: 'Busque conforme a sus gustos',
                menu: 'Tipo de comida',
                filter1: 'Árabe',
                filter2: 'Mexicana',
                filter3: 'Peruana',
                height: 1,
              ),
              ContainerFiltro(
                title: 'Zona',
                subtitle: 'Es más cercano a:',
                menu: 'Especifiqie la zona',
                filter1: 'Usaquén',
                filter2: 'Zona T',
                filter3: 'La candelaria',
                height: 1,
              ),
              ContainerFiltro(
                title: 'Alergias',
                subtitle: 'Si no es alérgico a nada, omita el filtro "Alergía", de lo contrario, especifique su alergia',
                menu: 'Tipo de comida',
                filter1: 'Maní',
                filter2: 'Mariscos',
                filter3: 'Lactosa',
                height: 0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06 ,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Palette.gourmet)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        nextRoute();
                      },
                      child: Text(
                        "Actualizar",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Palette.gourmet,
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                          )
                        )
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
