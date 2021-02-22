import 'package:flutter/cupertino.dart';
import 'package:gourmet/config/visual/palette.dart';

class Styles {
  static TextStyle kTitleTextStyle = TextStyle(
      color: Palette.gourmet, fontSize: 13.0, fontWeight: FontWeight.w700);
  static TextStyle kLabelTextStyle = TextStyle(
      color: Palette.gourmet, fontSize: 13.0, fontWeight: FontWeight.w400);
  static TextStyle kLabelTextStyle2 = TextStyle(
      color: Palette.gourmet, fontSize: 15.0, fontWeight: FontWeight.w400);

  static TextStyle kLabelPrincipalTitleTextStyle = TextStyle(
      color: Palette.white, fontSize: 28, fontWeight: FontWeight.bold);

  static TextStyle kUnderlineLabelLogin = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w300, color: Palette.gourmet);

  static TextStyle kLabelTextFormFieldStyle =
      TextStyle(fontWeight: FontWeight.w300, color: Palette.white);

  static TextStyle kTituloRegistrarUsuario = TextStyle(
    color: Palette.gourmet,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kSubTituloRegistrarUsuario = TextStyle(
    color: Palette.gourmet,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kLabelRegistrar = TextStyle(
      color: Palette.black, fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle kUnderlineLabel = TextStyle(
      decoration: TextDecoration.underline, color: Palette.black, fontSize: 10);

  static TextStyle kOpacity =
      TextStyle(color: Palette.black.withOpacity(0.3), fontSize: 15);

  static TextStyle kLabelPerfil = TextStyle(
      color: Palette.black, fontSize: 15, fontWeight: FontWeight.w400);

  static TextStyle kLabelCerrarSesion =
      TextStyle(color: Palette.red, fontSize: 15, fontWeight: FontWeight.w500);

  static TextStyle kCaratulaStyle = TextStyle(
      color: Palette.white, fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle kPremiumStyle = TextStyle(
      color: Palette.black, fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle kPremiumStyle2 =
      TextStyle(color: Palette.black, fontSize: 14);

  static TextStyle kTituloPremium = TextStyle(
    color: Palette.gourmet,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kPremiumStyle3 = TextStyle(
      color: Palette.black.withOpacity(0.5),
      fontWeight: FontWeight.w600,
      fontSize: 16);

  static TextStyle kTitlePerfil = TextStyle(
      color: Palette.black, fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle kSubTitlePerfil = TextStyle(
    color: Palette.black.withOpacity(0.3),
    fontSize: 12,
  );

  static TextStyle configLbl = TextStyle(
    fontSize: 16,
    color: Palette.black.withOpacity(0.85),
  );
}
