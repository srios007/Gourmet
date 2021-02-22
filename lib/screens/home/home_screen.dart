import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

String searchText = "";


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          bottomOpacity: 0,
          backgroundColor: Palette.white,
          centerTitle: true,
          title: Text(
              'GOURMET',
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
              const SizedBox(height: 60),
              GourmetTextField(
                initialValue: searchText,
                icon: Icons.search,
                iconColor: Palette.gourmet,
                placeholder: "Buscar",
                onChanged: (text) {
                  searchText = text;
                  //_filterBySearch(text);
                },
              ),
            ],
          ),
        ),
      ),
      body:  Scaffold(
        body: CatapultaScrollView(
          child: Container(
            color: Palette.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        //builder: (context) => Premium(),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}