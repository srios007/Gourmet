import 'package:flutter/material.dart';


const kLabelColor = Color(0xFFAF774D);
const kWhiteColor = Color(0xFFFFFFFF);
const kDividerColor = Color(0XFFE8E8E8);
const kBlackColor = Color(0xFF000000);
const kRedColor = Color(0xFFC50000);
const kYellowColor = Color(0xFFFFC100);
const kYellowColor2 = Color(0xFFFFD500);

TextStyle kTitleTextStyle = TextStyle(
  color: kLabelColor,
  fontSize: 13.0,
  fontWeight: FontWeight.w700
);

TextStyle kLabelTextStyle = TextStyle(
  color: kLabelColor,
  fontSize: 13.0,
  fontWeight: FontWeight.w400
);
TextStyle kLabelTextStyle2 = TextStyle(
    color: kLabelColor,
    fontSize: 15.0,
    fontWeight: FontWeight.w400
);

TextStyle kLabelPrincipalTitleTextStyle = TextStyle(
  color: kWhiteColor,
  fontSize: 28,
  fontWeight: FontWeight.bold
);

TextStyle kUnderlineLabelLogin = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w300,
  color: kLabelColor
);

TextStyle kLabelTextFormFieldStyle = TextStyle(
  fontWeight: FontWeight.w300,
  color: kWhiteColor);

TextStyle kTituloRegistrarUsuario = TextStyle(
  color: kLabelColor,
  fontSize: 17,
  fontWeight: FontWeight.w600,
);

TextStyle kSubTituloRegistrarUsuario = TextStyle(
  color: kLabelColor,
  fontSize: 17,
  fontWeight: FontWeight.w400,
);

TextStyle kLabelRegistrar = TextStyle(
  color: kBlackColor,
  fontSize: 16,
  fontWeight: FontWeight.w400
);

TextStyle kUnderlineLabel = TextStyle(
  decoration: TextDecoration.underline,
  color: kBlackColor,
  fontSize: 10
);

TextStyle kOpacity = TextStyle(
  color: kBlackColor.withOpacity(0.3),
  fontSize: 15
);

TextStyle kLabelPerfil = TextStyle(
  color: kBlackColor,
  fontSize: 15,
  fontWeight: FontWeight.w400
);

TextStyle kLabelCerrarSesion = TextStyle(
  color: kRedColor,
  fontSize: 15,
  fontWeight: FontWeight.w500
);

TextStyle kCaratulaStyle = TextStyle(
  color: kWhiteColor,
  fontSize: 16,
  fontWeight: FontWeight.w500
);

TextStyle kPremiumStyle = TextStyle(
  color: kBlackColor,
  fontSize: 16,
  fontWeight: FontWeight.w500
);

TextStyle kPremiumStyle2 = TextStyle(
  color: kBlackColor,
  fontSize: 14
);

TextStyle kTituloPremium = TextStyle(
  color: kLabelColor,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);

TextStyle kPremiumStyle3 = TextStyle(
    color: kBlackColor.withOpacity(0.5),
    fontWeight: FontWeight.w600,
    fontSize: 16
);

TextStyle kTitlePerfil = TextStyle(
    color: kBlackColor,
    fontSize: 20,
    fontWeight: FontWeight.w500
);

TextStyle kSubTitlePerfil = TextStyle(
  color: kBlackColor.withOpacity(0.3),
  fontSize: 12,
);

BorderRadius kRadiusRegister = BorderRadius.vertical(top: Radius.circular(14));

BorderRadius kRadiusAll = BorderRadius.circular(14);

BoxDecoration kPrincipalDecoration = BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.fill,
    image: AssetImage(
        "imagenes/fondoiniciarsesion.jpg"
    ),
  ),
);
