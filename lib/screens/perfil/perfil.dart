import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/components/catapultaScrollView.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/config/constants/user_constants.dart';
import 'package:gourmet/screens/perfil/configuracion.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String email = "";
  String phoneNumber = "";

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
        actions: [
          CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Configuracion(),
                  ),
                );
              },
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('imagenes/configurar.png'),
              )),
        ],
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
                      style: GoogleFonts.poppins(
                          textStyle: Styles.kLabelPerfil),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 22),
              child: Container(
                height: 1,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ContainerRegistrar(
                title: "E-mail",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                placeholder: "correo@gourmet.com",
                iconColor: emailRegExp.hasMatch(email) || email == ""
                    ? Palette.gourmet
                    : Palette.red,
                initialValue: "${user.email}",
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ContainerRegistrar(
                title: "Celular",
                initialValue: "${user.phoneNumber}",
                icon: Icons.phone_outlined,
                placeholder: "321 1234567",
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    phoneNumber = text;
                  });
                },
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GourmetButton(),
            )
          ],
        ),
      ),
    );
  }
}
