import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gourmet/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

import '../screens.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

class _CrearCuentaState extends State<CrearCuenta> {
  /// Variables registro
  String name = "";
  String email = "";
  String password = "";
  String phoneNumber = "";

  /// Estado de carga del botón
  bool isLoadingBtn = false;

  /// Regex para validación de mail
  RegExp emailRegExp = RegExp("[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            child: CatapultaScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CupertinoNavigationBarBackButton(
                        color: Palette.gourmet,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Image.asset("imagenes/logoInicio.png"),
                  ),
                  Text(
                    'Bienvenido a Gourmet',
                    style:
                        GoogleFonts.poppins(textStyle: Styles.kTituloRegistrarUsuario),
                  ),
                  Text('Regístrate',
                      style: GoogleFonts.poppins(
                          textStyle: Styles.kSubTituloRegistrarUsuario)),
                  const SizedBox(height: 16),
                  GourmetTextField(
                    title: "Nombre Completo",
                    icon: Icons.perm_identity_outlined,
                    placeholder: "Juan Caro",
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (text) {
                      setState(() {
                        name = text;
                      });
                    },
                  ),
                  GourmetTextField(
                    title: "E-mail",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    placeholder: "correo@gourmet.com",
                    iconColor: emailRegExp.hasMatch(email) || email == ""?Palette.gourmet :Palette.red ,
                    onChanged: (text) {
                      setState(() {
                        email = text;
                      });
                    },
                  ),
                  GourmetTextField(
                    title: "Contraseña",
                    isPassword: true,
                    placeholder: "***********",
                    icon: Icons.lock_outline_rounded,
                    onChanged: (text) {
                      setState(() {
                        password = text;
                      });
                    },
                  ),
                  GourmetTextField(
                    title: "Celular",
                    icon: Icons.phone_outlined,
                    placeholder: "321 1234567",
                    keyboardType: TextInputType.number,

                    onChanged: (text) {
                      setState(() {
                        phoneNumber = text;
                      });
                    },
                  ),
                  Expanded(child: Container()),

                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GourmetButton(
                      onPressed: () {
                        if (_canPush()) {
                          _registerUser();
                        } else {
                          Alert(
                            context: context,
                            title: "Crear cuenta",
                            desc:
                                "Por favor, rellena los campos para continuar.",
                            buttons: [
                              DialogButton(
                                child: Text("Ok",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                                color: Palette.gourmet,
                              )
                            ]
                          ).show();
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
                            builder: (context) => IniciarSesion(),
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      child:RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "¿Ya tienes una cuenta?,",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Palette.gourmet
                              )
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " inicia sesión",
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
      ),
    );
  }

  bool _canPush() {
    return name != "" && email != "" && password != "" && phoneNumber != "";
  }

  /// back
  void _registerUser() {
    print("⏳ REGISTRARÉ USER");
    setState(() {
      isLoadingBtn = true;
    });
    Auth().signUp(email, password).then((userId) async {
      Map<String, dynamic> userMap = {
        "name": name,
        "email": email,
        "isAdmin": false,
        "phoneNumber": phoneNumber
      };

      FirebaseUser firebaseUser = await Auth().getCurrentUser();
      Firestore.instance
          .collection("users")
          .document(userId)
          .setData(userMap)
          .then((r) {
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
              builder: (context) => NavScreen(),
            ),
          );
          setState(() {
            isLoadingBtn = false;
          });
        }).catchError((e) {
          print("💩 ERROR AL OBTENER USUARIO: $e");
        });
        print("✔️️ USER REGISTRADO");
      });
    }).catchError((e) {
      print("💩️ ERROR AL REGISTRARSE: $e");
      if (e is PlatformException) {
        handleSignUpError(context, e.code);
      }
      setState(() {
        isLoadingBtn = false;
      });
    });
  }
}
