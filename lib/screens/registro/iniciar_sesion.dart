import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../screens.dart';

class IniciarSesion extends StatefulWidget {
  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {

  /// Variables inicio de sesión
  String email = "";
  String password = "";

  /// Estado de carga del botón
  bool isLoadingBtn = false;

  // Regex para validación de mail
  RegExp emailRegExp = RegExp("[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CatapultaScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset("imagenes/logoInicio.png"),
                ),
                Text(
                  'Bienvenido a Gourmet',
                  style:
                  GoogleFonts.poppins(textStyle: Styles.kTituloRegistrarUsuario),
                ),
                Text('Inicia sesión',
                    style: GoogleFonts.poppins(
                        textStyle: Styles.kSubTituloRegistrarUsuario)),
                const SizedBox(height: 16),
                Text('Iniciar Sesión',
                    style: GoogleFonts.poppins(
                        textStyle: Styles.kLabelPrincipalTitleTextStyle)),
                ContainerRegistrar(
                  title: "E-mail",
                  icon: Icons.email_outlined,
                  iconColor: emailRegExp.hasMatch(email) || email == ""?Palette.gourmet :Palette.red ,
                  placeholder: 'E-mail',
                  onChanged: (text) {
                    setState(() {
                      email = text;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ContainerRegistrar(
                  title: "Contraseña",
                  icon: Icons.lock_outline_rounded,
                  placeholder: 'Contraseña',
                  onChanged: (text) {
                    setState(() {
                      password = text;
                    });
                  },
                  isPassword: true,
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GourmetButton(
                    onPressed: () {
                      if(_canPush()){
                        _loginUser();
                      }else{
                        Alert(
                            context: context,
                            title: "Iniciar sesión",
                            desc: "Por favor, rellena los campos para continuar.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(color: Colors.white, fontSize: 20),
                                    )                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                                color: Palette.gourmet,
                              )
                            ]).show();
                      }
                    },
                    canPush: _canPush(),
                    isLoading: isLoadingBtn,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CrearCuenta(),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  child:RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "¿No tienes una cuenta?,",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Palette.gourmet
                        )
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " regístrate",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Palette.gourmet
                            )
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _canPush() {
    return email != "" && password != "";
  }

  void _loginUser() {
    print("⏳ INICIARÉ SESIÓN");
    setState(() {
      isLoadingBtn = true;
    });

    Auth().signIn(email, password).then((firebaseUser) async {
      Firestore.instance
          .document("users/${firebaseUser?.uid}")
          .get()
          .then((userDoc) {
        user.id = userDoc.documentID;
        user.name = userDoc.data["name"];
        user.email = userDoc.data['email'];
        user.isAdmin = userDoc.data['isAdmin'];
        user.phoneNumber = userDoc.data["phoneNumber"];


        print("✔️ USER DESCARGADO");
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        
        setState(() {
          isLoadingBtn = false;
        });
      }).catchError((e) {
        print("💩 ERROR AL OBTENER USUARIO: $e");
      });

      print("✔️ SESIÓN INICIADA");
    }).catchError((e) {
      print("💩️ ERROR AL INICIAR SESIÓN: $e");
      if (e is PlatformException) {
        handleSignInError(context, e.code);
      }
      setState(() {
        isLoadingBtn = false;
      });
    });
  }
}
