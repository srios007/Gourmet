import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';

class Caratula extends StatelessWidget {
  Caratula({
    @required this.restaurantName,
    @required this.qualification,
    @required this.imageUrl,
    this.onPressed

  });
  final String restaurantName;
  final String qualification;
  final String imageUrl;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Palette.skeleton,
            image: DecorationImage(
              image: NetworkImage(
                  imageUrl
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantName,
                  style: GoogleFonts.poppins(
                      textStyle: Styles.kCaratulaStyle
                  ),
                ),


                Row(
                  children: <Widget>[

                    Icon(
                      Icons.star,
                      color: Palette.yellowDark,
                      size: 20,
                    ),
                    Text(
                        qualification,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Palette.yellowDark,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                        )
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
