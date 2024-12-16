import 'package:flutter/material.dart';
import 'package:prueba_ricardo/widgets/exports_widgets.dart';

//BOTON SINCRONO
Widget materialChidoButton({
  required VoidCallback onPressed,
  required String text,
  required double minWidth,
  required Color color,
  required double textSize,
  double? borderRadius,
  Color? textColor,
  Color? borderColor,
  double? borderWidth,
  FontWeight? nigga,
}) {
  return MaterialButton(
    onPressed: onPressed,
    minWidth: minWidth,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      side: BorderSide(color: borderColor ?? color, width: borderWidth ?? 0),
    ),
    child: customNiggaText(
      text: text,
      size: textSize,
      color: textColor,
      nigga: nigga
    ),
  );
}

//BOTÓN ASÍNCRONO
Widget materialFutureButton({
  required Future<void> Function()? onPressed,
  required String text,
  required double minWidth,
  required Color color,
  required double textSize,
  double? borderRadius,
  Color? textColor,
  Color? borderColor,
  double? borderWidth,
  FontWeight? nigga,
}) {
  return MaterialButton(
    onPressed: onPressed,
    minWidth: minWidth,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      side: BorderSide(color: borderColor ?? color, width: borderWidth ?? 0),
    ),
    child: customNiggaText(
      text: text,
      size: textSize,
      color: textColor,
      nigga: nigga
    ),
  );
}