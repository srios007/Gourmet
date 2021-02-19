import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/constants/user_constants.dart';
import 'package:gourmet/config/firebase/auth/authentication.dart';
import 'package:gourmet/config/firebase/auth/handles.dart';
import 'package:gourmet/config/constantes.dart';
import 'package:gourmet/components/catapultaScrollView.dart';
import 'package:gourmet/model/users/user_model.dart';
import 'package:gourmet/screens/registro/iniciar_sesion.dart';

class Configuracion extends StatefulWidget {
  @override
  _ConfiguracionState createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: kLabelColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Configuración',
          style: kTituloRegistrarUsuario,
        ),
      ),
      body: CatapultaScrollView(
        child: Column(
          children: [
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CupertinoButton(
                onPressed: () {
                  _showSignOutAlert();
                },
                child: Text(
                  'Cerrar Sesión',
                  style: GoogleFonts.poppins(textStyle: kLabelCerrarSesion),
                ),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.1),
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
