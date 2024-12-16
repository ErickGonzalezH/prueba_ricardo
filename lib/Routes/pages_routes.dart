import 'package:flutter/material.dart';

import 'package:prueba_ricardo/Routes/routes.dart';
import 'package:prueba_ricardo/screens/exports_screens.dart';

abstract class PagesRoutes {

  static Map<String, Widget Function(BuildContext)> route = {

    Routes.inicialScreen: (context) => const HomeScreen(),
    // Routes.listaScreen: (context) => const ListaScreen(),
    Routes.formularioScreen: (context) => const HomeScreen(),
    Routes.dependenciasScreen: (context) => const HomeScreen(),

  };

}