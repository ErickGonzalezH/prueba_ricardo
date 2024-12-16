import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:prueba_ricardo/colors/colors.dart';

//IMAGEN EN CONTAINER
Widget cachedImageNetwort(
  String imageURL
) => CachedNetworkImage(
  imageUrl: imageURL,
  fit: BoxFit.cover,
  placeholder: (context, url) {
      return const Center(
        child: CircularProgressIndicator(
          color: kconstPrimaryColor,
          strokeWidth: 2,
        ),
      );
    },
    errorWidget: (context, url, error) {
      return const Center(
        child: Text(
          'Error',
          style: TextStyle(color: Colors.red),
        ),
      );
    },
  );
  
//DISEÑO IMAGEN CON POP UP
Widget imageWithPopup({
  required BuildContext context,
  required String imageUrl,
  double? width,
  double? height,
}) {
  return Container(
    width: width ?? 150,
    height: height ?? 150,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(10),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      cachedImageNetwort(imageUrl),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close,
                                color: Colors.white, size: 30),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: cachedImageNetwort(imageUrl),
    ),
  );
}