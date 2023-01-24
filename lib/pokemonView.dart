import 'dart:io';

import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

class Pokemonview extends StatefulWidget {
  const Pokemonview({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  _PokemonviewState createState() => _PokemonviewState();
}

class _PokemonviewState extends State<Pokemonview> {
  @override
  final Controller _controller = Controller();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name + ' #' + widget.pokemon.no.toString()),
      ),
      body: Card(
        child: Column(
          children: [
            if (widget.pokemon.image != null)
              Expanded(
                child: Image.memory(
                  widget.pokemon.image!.buffer.asUint8List(
                      widget.pokemon.image!.offsetInBytes,
                      widget.pokemon.image!.lengthInBytes),
                ),
                flex: 4,
              ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _controller.getcontainertype(widget.pokemon.type1),
                    flex: 1,
                  ),
                  Expanded(
                    child: _controller.getcontainertype(widget.pokemon.type2),
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
                      child: ListView(children: <Widget>[
                        Container(
                          height: 50,
                          color: Colors.amber[600],
                          child: const Center(child: Text('Entry A')),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[500],
                          child: const Center(child: Text('Entry B')),
                        ),
                      ]),
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
