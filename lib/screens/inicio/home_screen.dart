import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:prueba_ricardo/screens/exports_screens.dart';
import 'package:prueba_ricardo/widgets/exports_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String nombre = 'Hola prro variable soundtrack list everyday';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //IMAGEN PRINCIPAL
            Stack(
              children: [
                SizedBox(
                  height: size.shortestSide * .6,
                  width: size.shortestSide,
                  child: Image.asset('assets/landscape.jpg', fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: customText(text: '¡Bienvenido!', color: Colors.white, size: size.shortestSide * .07)
                )
              ],
            ),

            //MENU DE OPCIONES
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customNiggaText(text: '¿Qué te gustaría hacer?', size: 20),
                  const Divider(),
                  menuOpciones(
                    size: size, 
                    image: 'assets/imagen1.jpg', 
                    title: 'Lista dinmámica', 
                    subtitle: 'Se muestra ejemplo de lista dinmáica', 
                    onPressed: () {
                      log('Se presionón la opción de lista');
                      // Navigator.pushNamed(context, Routes.listaScreen);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ListaScreen(size: size)
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  menuOpciones(
                    size: size, 
                    image: 'assets/imagen2.jpg', 
                    title: 'Formulario', 
                    subtitle: 'Se muestra ejemplo de un formulario', 
                    onPressed: () {
                      log('Se presionón la opción de lista');
                      // Navigator.pushNamed(context, Routes.listaScreen);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FormularioScreen(size: size)
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  menuOpciones(
                    size: size, 
                    image: 'assets/imagen3.jpg', 
                    title: 'Dependencias externas', 
                    subtitle: 'Se muestra ejemplos de dependencias de 3ros', 
                    onPressed: () {
                      log('Se presionón la opción de dependencias');
                      // Navigator.pushNamed(context, Routes.listaScreen);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DependenciasScreen(size: size)
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  menuOpciones(
                    size: size, 
                    image: 'assets/imagen4.jpg', 
                    title: 'Consumo de API', 
                    subtitle: 'Consumir información de internet', 
                    onPressed: () {
                      log('Se presionón la opción de dependencias');
                      // Navigator.pushNamed(context, Routes.listaScreen);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ConsumoScreen(size: size)
                        ),
                      );
                    }, 
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}