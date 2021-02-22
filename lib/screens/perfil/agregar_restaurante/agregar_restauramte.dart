import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/functions/functions.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AgregarRestaurante extends StatefulWidget {
  @override
  _AgregarRestauranteState createState() => _AgregarRestauranteState();
}

class _AgregarRestauranteState extends State<AgregarRestaurante>
    with AutomaticKeepAliveClientMixin<AgregarRestaurante> {
  final picker = ImagePicker(); // Picker de imágenes del dispositivo
  File helperImageFile;

  String nombreRestaurante = "";
  String direccion = "";
  String horario = "";
  String thumbnailURL;
  String pickerData = "";
  bool validationImagen = false;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: CupertinoNavigationBar(
        backgroundColor: Palette.white,
        actionsForegroundColor: Palette.gourmet,
        border: Border.all(color: Palette.transparent),
        middle: Text(
          "Agregar restaurante",
          //style: Styles.navTitleLbl,
        ),
      ),
      body: CatapultaScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Portada",
                style: Styles.kLabelRegistrar,
              ),
              const SizedBox(height: 8),
              Text(
                "Toma una foto horizontal para que tus clientes conozcan tu restaurante.",
                // style: Styles.secondaryLbl,
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: _alertImagePicker,
                child: Container(
                  height: (MediaQuery.of(context).size.width - 32) * 9 / 16,
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                    color: helperImageFile == null
                        ? Palette.skeleton
                        : Palette.transparent,
                    image: helperImageFile == null
                        ? null
                        : DecorationImage(
                            image: FileImage(helperImageFile),
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                  child: helperImageFile == null
                      ? Center(
                          child: Text(
                            "Toca para tomar una foto",
                            style: TextStyle(
                              fontSize: 15,
                              color: validationImagen
                                  ? Palette.red
                                  : Palette.black.withOpacity(0.25),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              const SizedBox(height: 32),
              GourmetTextField(
                title: "Nombre del restaurante",
                placeholder: "Capitalino",
                icon: Icons.business,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (text) {
                  setState(() {
                    nombreRestaurante = text;
                  });
                },
              ),
              GourmetTextField(
                title: "Dirección",
                icon: Icons.place,
                placeholder: "Cra 7 call 40",
                textCapitalization: TextCapitalization.sentences,
                onChanged: (text) {
                  setState(() {
                    direccion = text;
                  });
                },
              ),
              GourmetTextField(
                title: "Horario",
                icon: Icons.schedule,
                placeholder: "De lunes a viernes",
                textCapitalization: TextCapitalization.sentences,
                onChanged: (text) {
                  setState(() {
                    horario = text;
                  });
                },
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: GourmetButton(
                  onPressed: () {
                    if (cansPush()) {
                      _uploadProductImage();
                    }
                  },
                  title: "Agregar",
                  canPush: cansPush(),
                  isLoading: isLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// ::::::::::::: FUNCTIONS ::::::::::::: ///

  bool cansPush() {
    return nombreRestaurante != "" &&
        direccion != "" &&
        horario != "" &&
        helperImageFile != null;
  }

  void _alertImagePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text("Tomar foto"),
            onPressed: () {
              Navigator.pop(context);
              add();
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


  Future _getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        helperImageFile = File(pickedFile.path);
        validationImagen = false;
      }
    });
  }

  Future<void> _handleCamera(Permission permission) async {
    final PermissionStatus status = await permission.request();
  }

  Future<void> add() async {
    await _handleCamera(Permission.camera);
    await _getImageFromCamera();
  }

  /// ::::::::::::: BACK ::::::::::::: ///
  void _addRestaurant() {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic> restaurantDoc = {
      "restaurantName": nombreRestaurante,
      "address": direccion,
      "schedule": horario,
      "imageUrl": thumbnailURL,
      "qualification": 0
    };

    LogMessage.post("RESTAURANT");
    References.restaurants.add(restaurantDoc).then((value) {
      LogMessage.postSuccess("RESTAURANT");
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);

    }).catchError((e) {
      LogMessage.postError("RESTAURANT", e);
      setState(() {
        isLoading = false;
      });

    });
  }
  Future <void> _uploadProductImage() async {
    setState(() {
      isLoading = true;
    });

    LogMessage.post("IMAGEN");
    Random random = Random();
    StorageTaskSnapshot snapshot = await FirebaseStorage.instance
        .ref()
        .child("thumbnails/${user.id}/${random.nextInt(1000000000)}")
        .putFile(helperImageFile)
        .onComplete;

    if (snapshot.error == null) {
      LogMessage.postSuccess("IMAGEN");

      thumbnailURL = await snapshot.ref.getDownloadURL();

      _addRestaurant();
    } else {
      LogMessage.postError("RESPONSE", snapshot.error);
      setState(() {
        isLoading = false;
      });
      showBasicAlert(
        context,
        "La foto no se subió",
        "Por favor, intenta de nuevo más tarde.",
      );
    }
  }
}
