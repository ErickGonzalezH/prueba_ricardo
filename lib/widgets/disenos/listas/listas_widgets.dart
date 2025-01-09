import 'package:flutter/material.dart';
import 'package:prueba_ricardo/colors/colors.dart';
import 'package:prueba_ricardo/widgets/exports_widgets.dart';

Widget listaFutureVacia({
  required String text,
  required Size size,
  required Future<void> delayFuture,
  Color? textColor,
  double? textSize,
}) {
  return FutureBuilder<void>(
    future: delayFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {

        return Center(
          child: Column(
            children: [
              SizedBox(height: size.height * .03),
              const CircularProgressIndicator(color: kconstPrimaryColor),
              SizedBox(height: size.height * .05),
            ],
          ),
        );

      } else {

        return Center(
          child: Column(
            children: [
              SizedBox(height: size.height * .03),
              customNiggaText(
                text: text,
                size: textSize,
                color: textColor ?? Colors.grey,
                maxLines: 5,
                nigga: FontWeight.w400
              ),
            ],
          ),
        );
        
      }
    },
  );
}

