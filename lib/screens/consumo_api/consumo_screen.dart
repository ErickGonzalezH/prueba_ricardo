import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:prueba_ricardo/screens/exports_screens.dart';

import 'package:prueba_ricardo/widgets/exports_widgets.dart';
import 'package:prueba_ricardo/providers/pokemon_provider.dart';

class ConsumoScreen extends StatefulWidget {
   final Size size;
  const ConsumoScreen({super.key, required this.size});

  @override
  State<ConsumoScreen> createState() => _ConsumoScreenState();
}

class _ConsumoScreenState extends State<ConsumoScreen> {

  bool carga = false;
  late Future<void> _delayFuture;

  @override
  void initState() {
    super.initState();
    _delayFuture = Future.delayed(const Duration(seconds: 5));

    SchedulerBinding.instance.addPostFrameCallback((_){
      final pokemonProvider = Provider.of<PokemonProvider>(context, listen: false);
      pokemonProvider.getPokemones();
    });
  }


  @override
  Widget build(BuildContext context) {
      final pokemonProvider = Provider.of<PokemonProvider>(context);
    return Scaffold(

      appBar: AppBar(title: customText(text: 'Consumo API', color: Colors.white)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            customNiggaText(text: 'Lista de pokemones', size: 20),
            SizedBox(height: widget.size.shortestSide * .03),

            //LISTA DINAMICA CON MAPA SENCILLO
            CustomCard(

              childPadding: 5,
              color: Colors.transparent,
              elevation: 0,
              borderRadius: 10,
              borderColor: Colors.black,
              borderWidth: 1,
              height: widget.size.shortestSide * 1.7,

              child: pokemonProvider.pokemones.isNotEmpty
                ? Scrollbar(
                    child: CustomScrollView(
                      slivers: [
                        SliverList.builder(
                          itemCount: pokemonProvider.pokemones.length,
                          itemBuilder: (context, index) {
                            final pokemon = pokemonProvider.pokemones[index].results.first;
                            return CustomCard(
                              childPadding: 0,
                              borderColor: Colors.grey,
                              elevation: 0,
                              borderRadius: 10,
                              child: ListTile(
                                leading: customNiggaText(text: '${index + 1}'),
                                title: richText(
                                  text1: 'Nombre: ',
                                  fontWeight1: FontWeight.bold,
                                  text2: pokemon.name
                                ),
                                subtitle: Text('Url: ${pokemon.url}'),
                                trailing: IconButton(
                                  onPressed: () {
                                    log('Link del pokemon: ${pokemon.url}');
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => InfoPokemonScreen(
                                          size: widget.size,
                                          link: pokemon.url,
                                          pokemon: pokemon.name,
                                        )
                                      ),
                                    );
                                  }, 
                                  icon: const Icon(Icons.info)
                                ),
                              ),
                            );
                          }
                        )
                      ],
                    )
                  )
                : listaFutureVacia(
                    delayFuture: _delayFuture,
                    text: 'No hay pokemones disponibles', 
                    size: widget.size
                  ) 
            ),
          ],
        ),
      )
    );
  }
}