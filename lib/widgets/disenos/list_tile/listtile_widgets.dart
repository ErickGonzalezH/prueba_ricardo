import 'package:flutter/material.dart';
import 'package:prueba_ricardo/widgets/exports_widgets.dart';

Widget menuOpciones({
  required Size size,
  required String image,
  required String title,
  required String subtitle,
  required void Function()? onPressed,
}){
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: SizedBox(
      height: size.shortestSide * .15,
      width: size.shortestSide * .15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, fit: BoxFit.cover)
      ),
    ),
    title: customNiggaText(text: title),
    subtitle: customText(text: subtitle),
    trailing: IconButton(
      onPressed: onPressed, 
      icon: const Icon(Icons.arrow_forward_ios_rounded)
    ),
  );
}