import 'dart:io';

import 'package:flutter/material.dart';

class Pokemonview extends StatefulWidget {
  const Pokemonview({Key? key}) : super(key: key);

  @override
  _PokemonviewState createState() => _PokemonviewState();
}

class _PokemonviewState extends State<Pokemonview> {
  @override
  var imagenpokemon = File('Pokemonfotos/001.png');
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PukimonPito Nº001'),
      ),
      //body: Image.file(imagenpokemon)
      body: Card(
        child: Column(
          children: [
            Expanded(
              child: Text('IMAGEN'),
              flex: 4,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text('Tipo 1: '),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text('Tipo 2: '),
                    flex: 1,
                  )
                ],
              ),
              flex: 1,
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(),
                      flex: 1,
                    ),
                    Expanded(
                      child: ListView(),
                      flex: 1,
                    ),
                    Expanded(
                      child: ListView(),
                      flex: 1,
                    )
                  ],
                ),
                flex: 3)
          ],
        ),
      ),
    );
  }
}
