import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';

class ContainerIniciarSesion extends StatelessWidget {
  ContainerIniciarSesion(
      {this.placeholder,
      this.keyboardType,
      this.isPassword,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.imageRoute,
      this.iconColor,
      this.initialValue,
      this.textCapitalization,
      this.validationText,
      this.autoFocus,
      this.maxLength,
      this.textInputFormatters,
      this.prefixWidget,
      this.key,
      this.width,
      this.enabled,
      this.onFieldSubmitted,
      this.suffixText,
      this.textAlign
      });

  Key key;
  String placeholder;
  TextInputType keyboardType;
  bool isPassword;
  Function onChanged;
  Function onTap;
  Function onEditingComplete;
  String imageRoute;
  Color iconColor;
  String initialValue;
  TextCapitalization textCapitalization;
  String validationText;
  bool autoFocus;
  int maxLength;
  List<TextInputFormatter> textInputFormatters;
  Widget prefixWidget;
  double width;
  bool enabled = true;
  Function onFieldSubmitted;
  String suffixText;
  var textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), border: Border.all(color: Palette.white)),
      child: Center(
        child: TextFormField(
          key: key,
          enabled: enabled,
          autofocus: autoFocus ?? false,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15
          ),
          keyboardAppearance: Brightness.light,
          textCapitalization:
          textCapitalization ?? TextCapitalization.none,
          initialValue: initialValue,
          textAlign: textAlign ??TextAlign.center,
          decoration:  InputDecoration(
            hintText: placeholder,
            suffixText: suffixText ?? "",
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
          inputFormatters: textInputFormatters ?? [],
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: isPassword ?? false,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,

        ),
      ),
    );
  }
}
