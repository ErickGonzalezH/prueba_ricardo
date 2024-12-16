import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_ricardo/colors/colors.dart';

//OPCION DE CONTENEDORES
Widget containerCampos({
  required BuildContext context, 
  required Size size, 
  required String text, 
  required Widget widget,
}) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(text, style: const TextStyle(fontWeight: FontWeight.normal)),
            widget,
          ],
        ),
      ),
    );

//FORM CHIDO
Widget textform(
  BuildContext context, 
  Size size, 
  Function(String)? onchange,
  String? Function(String?)? validator, 
  String hintText,
    {
      TextInputType? textInputType,
      bool? obscureText,
      bool? readOnly,
      IconData? icon,
      int? maxLenght,
      int? maxLines,
      int? minLines,
      String? initialvalue,
      Widget? iconButton,
      TextEditingController? controller,
      List<TextInputFormatter>? inputFormatters
    }
) => GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: TextFormField(

      inputFormatters: inputFormatters,
      controller: controller,
      maxLength: maxLenght,
      minLines: minLines,
      maxLines: maxLines,
      initialValue: initialvalue,
      onChanged: onchange,
      validator: validator,
      readOnly: readOnly ?? false,

      style: TextStyle(
        fontSize: size.shortestSide / 20,
        fontWeight: FontWeight.normal,
      ),
      
      obscureText: obscureText ?? false,
      keyboardType: textInputType ?? TextInputType.name,
      
      //DECORACION DEL FORMULARIO
      decoration: InputDecoration(
        suffixIcon: iconButton,
        prefixIcon: Icon(icon, color: Colors.black),

        hintText: hintText,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: kconstPrimaryColor),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),

      )


    ),
  );    