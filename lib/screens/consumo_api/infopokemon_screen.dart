import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ricardo/colors/colors.dart';

import 'package:prueba_ricardo/providers/pokemon_provider.dart';
import 'package:prueba_ricardo/widgets/exports_widgets.dart';

class InfoPokemonScreen extends StatefulWidget {
    final Size size;
    final String link;
    final String pokemon;
  const InfoPokemonScreen({super.key, required this.size, required this.link, required this.pokemon});

  @override
  State<InfoPokemonScreen> createState() => _InfoPokemonScreenState();
}

class _InfoPokemonScreenState extends State<InfoPokemonScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_){
      final pokemonInfoProvider = Provider.of<PokemonProvider>(context, listen: false);
      pokemonInfoProvider.getInfoPokemon(link: widget.link);
    });
  }

  @override
  Widget build(BuildContext context) {
      final pokemonInfoProvider = Provider.of<PokemonProvider>(context);
      final pokemon = pokemonInfoProvider.infoPokemon;
      if(pokemon == null){
        return Scaffold(
          appBar: AppBar(title: customNiggaText(text: 'Información de ${widget.pokemon}', color: Colors.white)),
          body: const SingleChildScrollView(
            child: CircularProgressIndicator(color: kconstPrimaryColor),
          ),
        );
      }

    return Scaffold(

      appBar: AppBar(title: customNiggaText(text: 'Información de ${widget.pokemon}', color: Colors.white)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            
            //NOMBRE DEL POKEMON
            CustomCard(
              borderRadius: 15,
              borderWidth: 2,
              borderColor: Colors.grey,
              elevation: 1,
              width: widget.size.shortestSide,
              height: widget.size.shortestSide * .15,
              child: Center(
                child: richText1(
                  text1: 'Nombre de pokemon: ', 
                  text2: pokemonInfoProvider.infoPokemon!.name,
                ),
              ),
            ),

            SizedBox(height: widget.size.shortestSide * .03),
            customNiggaText(text: 'Información básica', size: 20),
            SizedBox(height: widget.size.shortestSide * .03),
            
            //INFORMACION COMPLEMENTARIA
            CustomCard(
              childPadding: 10,
              borderRadius: 15,
              borderWidth: 2,
              borderColor: Colors.grey,
              elevation: 1,
              width: widget.size.shortestSide,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText1(
                    text1: 'Peso(kg): ', 
                    text2: pokemonInfoProvider.infoPokemon!.weight.toString(),
                  ),
                  SizedBox(height: widget.size.shortestSide * .015),
                  richText1(
                    text1: 'Experiencia Base: ', 
                    text2: pokemonInfoProvider.infoPokemon!.baseExperience.toString(),
                  ),
                  SizedBox(height: widget.size.shortestSide * .015),
                  SizedBox(
                    height: widget.size.shortestSide * .2,
                    child: Scrollbar(
                      child: CustomScrollView(
                        slivers: [
                          SliverList.builder(
                            itemCount: pokemonInfoProvider.infoPokemon!.abilities.length,
                            itemBuilder: (context, index) {
                              final habilidades = pokemonInfoProvider.infoPokemon!.abilities[index];
                              return CustomCard(
                                childPadding: 10,
                                borderColor: Colors.grey,
                                elevation: 0,
                                borderRadius: 10,
                                child: customText(text: habilidades.ability.name)
                              );
                            }
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}