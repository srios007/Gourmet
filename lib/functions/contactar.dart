import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactar {
  static void llamar(BuildContext context, String phoneNumber) async {
    phoneNumber.replaceAll("+", "");
    String url = "tel:$phoneNumber";
    await canLaunch(url)
        ? await launch(url)
        : showAlert(
            context: context,
            title: "No pudimos llamar al $phoneNumber.",
            body: "",
            actions: [
              AlertAction(
                text: "Volver",
              ),
              AlertAction(
                text: "Escribir",
                isDefaultAction: true,
                onPressed: () {
                  escribir(context, phoneNumber);
                },
              ),
            ],
          );
  }

  static void escribir(BuildContext context, String phoneNumber) async {
    phoneNumber.replaceAll("+", "");
    if (phoneNumber.length == 10) {
      phoneNumber = "57$phoneNumber";
    }
    await canLaunch("https://wa.me/$phoneNumber")
        ? launch("https://wa.me/$phoneNumber")
        : showAlert(
            context: context,
            title: "No pudimos abrir WhatsApp.",
            body: "",
            actions: [
              AlertAction(
                text: "Volver",
              ),
              AlertAction(
                text: "Llamar",
                isDefaultAction: true,
                onPressed: () {
                  llamar(context, phoneNumber);
                },
              ),
            ],
          );
  }
}
