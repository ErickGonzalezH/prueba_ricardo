import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:prueba_ricardo/Routes/routes.dart';
import 'package:prueba_ricardo/Routes/pages_routes.dart';
import 'package:prueba_ricardo/colors/colors.dart';
import 'package:prueba_ricardo/providers/pokemon_provider.dart';
import 'package:prueba_ricardo/validators/formulario_validate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(miAppMultiProvider());
}

miAppMultiProvider() => MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => PokemonProvider()),
    ChangeNotifierProvider(create: (_) => ValidateFormulario()),
  ],
  child: const MyApp(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Poner banner de debug en falso
      debugShowCheckedModeBanner: false,

      //Tema global de la aplicación
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kconstPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
        )
      ),

      title: 'Prueba Ricardo',
      initialRoute: Routes.inicialScreen,
      routes: PagesRoutes.route,
    );
  }
}