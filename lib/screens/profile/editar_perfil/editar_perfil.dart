import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/functions/functions.dart';
import 'package:gourmet/model/models.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  String email = "";
  String phoneNumber = "";
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
  void initState() {
    // TODO: implement initState
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Palette.white,
        centerTitle: true,
        leading: CupertinoNavigationBarBackButton(
          color: Palette.gourmet,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Actualizar Datos',
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
                                'images/imagenperfil.png',
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
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GourmetTextField(
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
              child: GourmetTextField(
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
              child: GourmetButton(
                title: "Actualizar",
                canPush: _canPush(),
                onPressed: () {
                  if (_canPush()) {
                    _updateUser();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _canPush() {
    if ((phoneNumber != user.phoneNumber || email != user.email) &&
        emailRegExp.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  void _updateUser() {
    setState(() {
      isLoadingBtn = true;
    });
    Map<String, dynamic> liveMap = {
      "phoneNumber": phoneNumber,
      "email": email,
    };
    print("⏳ ACTUALIZARÉ LIVE");
    References.users.document(user.id).updateData(liveMap).then((r) async {
      print("✔ USER ACTUALIZADO");
      setState(() {
        isLoadingBtn = false;
      });
      Navigator.pop(context);
      showBasicAlert(
        context,
        "Actualizar",
        "sus datos fueron actualizados con éxito",
      );

    }).catchError((e) {
      setState(() {
        isLoadingBtn = false;
      });
      showBasicAlert(
        context,
        "Hubo un error.",
        "Por favor, intenta más tarde.",
      );
      print("💩️ ERROR AL ACTUALIZAR USER: $e");
    });
  }

  void _getUser() {
    LogMessage.get("USER");
    References.users.document(user.id).get().then((userDoc) {
      LogMessage.getSuccess("USER");
      if (userDoc.exists) {
        setState(() {
          user = User(
            id: userDoc.documentID,
            name: userDoc.data["name"],
            email: userDoc.data['email'],
            isAdmin: userDoc.data['isAdmin'],
            phoneNumber: userDoc.data["phoneNumber"]
          );
           email = user.email;
           phoneNumber = user.phoneNumber;
        });
      }
    }).catchError((e) {
      LogMessage.getError("CATEGORÍAS", e);
    });
  }
}
