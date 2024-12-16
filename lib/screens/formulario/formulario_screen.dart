import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ricardo/colors/colors.dart';

import 'package:prueba_ricardo/widgets/exports_widgets.dart';
import 'package:prueba_ricardo/validators/formulario_validate.dart';
import 'package:prueba_ricardo/widgets/disenos/botones/botones_widgets.dart';

class FormularioScreen extends StatefulWidget {
    final Size size;
  const FormularioScreen({super.key, required this.size});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {





  @override
  Widget build(BuildContext context) {
      final formularioValidate = Provider.of<ValidateFormulario>(context);
    return Scaffold(

      appBar: AppBar(title: customAppBarText(text: 'Formularios')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formularioValidate.keyFormulario,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [

              //NOMBRE
              containerCampos(
                context: context,
                size: widget.size,
                text: "Nombre Completo",
                widget: textform(
                  context,
                  widget.size,
                  (value) => formularioValidate.nombre = value,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    return null; // O cualquier otra validación que necesites
                  },
                  "Nombre completo",
                  textInputType: TextInputType.text,
                  obscureText: false,
                  icon: Icons.person,
                ),
              ),

              //Teléfono
              containerCampos(
                context: context,
                size: widget.size,
                text: "Teléfono",
                widget: textform(
                  context,
                  widget.size,
                  (value) => formularioValidate.telefono = value,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    if (int.parse(value) < 10){
                      return 'Ingresa un número válido';
                    }
                    return null;
                  },
                  "Telefono",
                  textInputType: TextInputType.number,
                  maxLenght: 10,
                  obscureText: false,
                  icon: Icons.phone,
                ),
              ),

              //BOTON DE ACCION
              materialFutureButton(

                onPressed: formularioValidate.isLoading
                  ? null
                  : () async {

                    log('Botón presionado');

                    //CIERRA EL TECLADO DEL TELEFONO
                    FocusScope.of(context).unfocus();

                    //VALIDACIONES
                    if(!formularioValidate.isValidForm()){
                      log('Formulario inválido');
                      return;
                    }

                    log('Formulario válido');
                    formularioValidate.isLoading = true;

                    log('Nombre: ${formularioValidate.nombre}');
                    await Future.delayed(const Duration(seconds: 2));
                    formularioValidate.isLoading = false;

                  },
                

                text: formularioValidate.isLoading ? 'Espere...' : 'Acción', 
                minWidth: widget.size.shortestSide * .7, 
                color: formularioValidate.isLoading ? Colors.black : kconstPrimaryColor, 
                textSize: 16,
                textColor: Colors.white
              )
              
            ],
          ),
        ),
      )
    );
  }
}