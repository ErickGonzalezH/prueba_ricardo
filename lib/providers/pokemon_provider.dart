import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:prueba_ricardo/constants/constants.dart';
import 'package:prueba_ricardo/models/individual_model.dart';
import 'package:prueba_ricardo/models/pokemon_model.dart';

class PokemonProvider extends ChangeNotifier {

  List<PokemonesModel> _pokemones = [];
  List<PokemonesModel> get pokemones => _pokemones;

  Future<void> getPokemones() async {
    var url = '$urlBase/pokemon?limit=101&offset=0';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode >= 200 && response.statusCode <= 299) {

        final Map<String, dynamic> data = json.decode(response.body);
        final pokemonesModel = PokemonesModel.fromJson(data);
        _pokemones = pokemonesModel.results.map((result) => PokemonesModel(
          count: pokemonesModel.count,
          next: pokemonesModel.next,
          previous: pokemonesModel.previous,
          results: [result],
        )).toList();
        notifyListeners();
      } else {
        log('Error, status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error del try es: $e');
    }
  }

  PokemonIndModel? _infoPokemon;
  PokemonIndModel? get infoPokemon => _infoPokemon;

  Future<void> getInfoPokemon({required String link}) async {
    var url = link;

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode >= 200 && response.statusCode <= 299) {

        final Map<String, dynamic> data = json.decode(response.body);
        _infoPokemon = PokemonIndModel.fromJson(data);
        notifyListeners();
      } else {
        log('Error, status: ${response.statusCode}');
      }
    } catch (e) {
      log('Error del try de individual es: $e');
    }
  }


}