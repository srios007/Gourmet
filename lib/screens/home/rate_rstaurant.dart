import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/config/visual/palette.dart';
import 'package:gourmet/functions/functions.dart';
import 'package:gourmet/model/models.dart';

class RateRestaurant extends StatefulWidget {
  RateRestaurant({this.restaurant});
  Restaurant restaurant;

  @override
  _RateRestaurantState createState() => _RateRestaurantState();
}

class _RateRestaurantState extends State<RateRestaurant> {
  int rate = -1;
  Color starColor = Palette.black.withOpacity(0.5);
  Color starColor2 = Palette.black.withOpacity(0.5);
  Color starColor3 = Palette.black.withOpacity(0.5);
  Color starColor4 = Palette.black.withOpacity(0.5);
  Color starColor5 = Palette.black.withOpacity(0.5);

  bool isLoadingBtn = false;
  String commentary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: CupertinoNavigationBar(
        actionsForegroundColor: Palette.gourmet,
        backgroundColor: Palette.white,
        border: Border(
          bottom: BorderSide(
            color: Palette.transparent,
            width: 1.0, // One physical pixel.
            style: BorderStyle.solid,
          ),
        ),
        middle: FittedBox(
          child: Text(
            "Calificar",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 17,
                color: Palette.gourmet,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: CatapultaScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(17, 36, 17, 0),
            child: Text(
              'Calificar a ${widget.restaurant.restaurantName}.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(17, 0, 17, 0),
            child: Text(
              'Por favor, haz una reseña sobre el restaurante.',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 13, color: Palette.black.withOpacity(0.5))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Palette.skeleton,
                image: DecorationImage(
                  image: NetworkImage(widget.restaurant.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),          ),
          ),
          Center(
            child: Text(
              widget.restaurant.restaurantName,
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      HapticFeedback.selectionClick();
                      rate = 1;
                      starColor = Palette.gourmet;
                      starColor2 = Palette.black.withOpacity(0.5);
                      starColor3 = Palette.black.withOpacity(0.5);
                      starColor4 = Palette.black.withOpacity(0.5);
                      starColor5 = Palette.black.withOpacity(0.5);
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: starColor,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      HapticFeedback.selectionClick();
                      rate = 2;
                      starColor = Palette.gourmet;
                      starColor2 = Palette.gourmet;
                      starColor3 = Palette.black.withOpacity(0.5);
                      starColor4 = Palette.black.withOpacity(0.5);
                      starColor5 = Palette.black.withOpacity(0.5);
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: starColor2,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      HapticFeedback.selectionClick();
                      rate = 3;
                      starColor = Palette.gourmet;
                      starColor2 = Palette.gourmet;
                      starColor3 = Palette.gourmet;
                      starColor4 = Palette.black.withOpacity(0.5);
                      starColor5 = Palette.black.withOpacity(0.5);
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: starColor3,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      HapticFeedback.selectionClick();
                      rate = 4;
                      starColor = Palette.gourmet;
                      starColor2 = Palette.gourmet;
                      starColor3 = Palette.gourmet;
                      starColor4 = Palette.gourmet;
                      starColor5 = Palette.black.withOpacity(0.5);
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: starColor4,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() {
                      rate = 5;
                      starColor = Palette.gourmet;
                      starColor2 = Palette.gourmet;
                      starColor3 = Palette.gourmet;
                      starColor4 = Palette.gourmet;
                      starColor5 = Palette.gourmet;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: starColor5,
                  ),
                ),
                Expanded(
                  child: Container(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Text(
                  'Escribir reseña ',
                  style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15)),
                ),
                Text(
                  '(Opcional)',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15, color: Palette.black.withOpacity(0.4))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: GourmetTextField(
              icon: Icons.rate_review,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (text) {
                setState(() {
                  commentary = text;
                });
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: GourmetButton(
              title: 'Enviar calificación',
              isLoading: isLoadingBtn,
            ),
          )
        ],
      )),
    );
  }
  void _makeRate() {
    Map<String, dynamic> messageMap = ({
      "name": user.name,
      "created": DateTime.now().millisecondsSinceEpoch,
      "rate": rate,
      "commentary": commentary

    });
    LogMessage.post("RATE");
    References.restaurants
        .document(widget.restaurant.id)
        .collection("rates")
        .add(messageMap)
        .then((r) async {
      LogMessage.postSuccess("RATE");
     Navigator.pop(context);
    }).catchError((e) {
      showBasicAlert(
        context,
        "Hubo un error.",
        "Por favor, intenta más tarde.",
      );
      LogMessage.postError("RATE", e);
    });
  }

}
