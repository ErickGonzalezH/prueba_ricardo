import 'package:flutter/material.dart';
import 'package:prueba_ricardo/models/individual_model.dart';
import 'package:prueba_ricardo/widgets/exports_widgets.dart';

class PruebaModelScreen extends StatelessWidget {
    final PokemonIndModel infoPokemon;
  const PruebaModelScreen({super.key, required this.infoPokemon});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: customNiggaText(text: 'Información de ${infoPokemon.name}', color: Colors.white)),

      body: const Center(
        child: Text('PruebaModelScreen'),
      ),
    );
  }
}