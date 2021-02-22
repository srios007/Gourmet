import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/model/models.dart';
import 'package:gourmet/screens/screens.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Palette.white,
        centerTitle: true,
        title: Text(
          'Perfil',
          style: GoogleFonts.poppins(textStyle: Styles.kTituloPremium),
        ),
      ),
      body: CatapultaScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconTheme(
                    data: IconThemeData(
                      color: Palette.gourmet,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'imagenes/imagenperfil.png',
                              ))),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width - 92,
                    child: Text(
                      "${user.name}",
                      style:
                          GoogleFonts.poppins(textStyle: Styles.kLabelPerfil),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 22),
              child: Container(
                height: 1,
                color: Palette.black.withOpacity(0.1),
              ),
            ),
            CatapultaOptionRow(
              text: "Editar perfil",
              iconData: Icons.edit,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditarPerfil(),
                  ),
                );
              },
            ),
            CatapultaOptionRow(
              text: "Cerrar sesión",
              iconData: Icons.logout,
              onTap: _showSignOutAlert,
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutAlert() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text("¿Quieres cerrar sesión?"),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text("Cerrar sesión"),
            isDestructiveAction: true,
            onPressed: () {
              _signOutUser();
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("Volver"),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _signOutUser() async {
    print("⏳ CERRARÉ SESIÓN");
    Auth().signOut().then((r) {
      print("✔️ SESIÓN CERRADA");
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => IniciarSesion(),
        ),
      );
      user = User();
    }).catchError((e) {
      print("💩️ ERROR AL CERRAR SESIÓN: $e");
      handleSignOutError(context);
    });
  }
}
