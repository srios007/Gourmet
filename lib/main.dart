import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gourmet/screens/registro/iniciar_sesion.dart';
import 'package:gourmet/screens/home_screen.dart';
import 'dart:async';
import 'config/config.dart';
import 'config/constants/support_constants.dart';
import 'config/constants/user_constants.dart';
import 'functions/functions.dart';
import 'model/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseAuth auth = FirebaseAuth.instance; // Instancia a FBAuth
  Firestore firestore = Firestore.instance; // Instancia a Firestore

  getDispositivoType(); // Identifica tipo de dispositivo

  LogMessage.get("CONSTANTES");
  References.constants.get().then((constantsDoc) async {
    if (constantsDoc.exists) {
      LogMessage.getSuccess("CONSTANTES");


        /// Datos de contacto a soporte
        support = Support(
          voiceNumber: constantsDoc["voiceNumber"],
          wappNumber: constantsDoc["wappNumber"],
        );

        var firebaseUser = await auth.currentUser();
        if (firebaseUser != null) {
          print("USUARIO LOGGEADO");

          // Usuario loggeado
          LogMessage.get("USER");
          firestore
              .document("users/${firebaseUser.uid}")
              .get()
              .then((userDoc) async {
            LogMessage.getSuccess("USER");

            if (userDoc.exists) {
              // Usuario existe en Firestore. Asigna datos del doc descargado.
              user = User(
                  id: userDoc.documentID,
                  name: userDoc.data["name"],
              email: userDoc.data['email'],
              isAdmin: userDoc.data['isAdmin'],

              );

                // El usuario activo puede acceder a la plataforma
                runApp(
                  MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: HomeScreen(),
                  ),
                );

            }
          }).catchError((e) {
            LogMessage.getError("USER", e);
          });
        } else {
          print("SIN SESIÓN ACTIVA");
          // Usuario no loggeado
          runApp(
            MaterialApp(
              debugShowCheckedModeBanner: false,
              home: IniciarSesion (),
            ),
          );
        }

    }
  }).catchError((e) {
    LogMessage.getError("CONSTANTES", e);
  });
}
