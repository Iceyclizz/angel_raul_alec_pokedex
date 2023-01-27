import 'dart:convert';

import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:flutter/material.dart';

class pokemonPicker extends StatefulWidget {
  const pokemonPicker(
      {Key? key, required this.equipoPokemon, required this.index})
      : super(key: key);
  final List<Pokemon>? equipoPokemon;
  final int index;

  @override
  State<pokemonPicker> createState() => _pokemonPickerState();
}

class _pokemonPickerState extends State<pokemonPicker> {
  final Controller _controller = Controller();
  final List<Pokemon> listaUpdateable = Controller().pokedex;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.initapp(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokédex'),
            ),
            body: ListView.builder(
              itemCount: _controller.pokedex.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.equipoPokemon != null &&
                        widget.equipoPokemon!.length >= widget.index + 1) {
                      widget.equipoPokemon?.removeAt(widget.index);
                      widget.equipoPokemon?.add(_controller.pokedex[index]);
                    } else {
                      widget.equipoPokemon?.add(_controller.pokedex[index]);
                    }
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Row(children: [
                      if (_controller.pokedex[index].image != null)
                        Image.memory(
                          base64Decode(_controller.pokedex[index].image!),
                            scale: 10),
                      Card(
                        child: Text("#${_controller.pokedex[index].no}"
                            "\t"
                            "${_controller.pokedex[index].name}"),
                      )
                    ]),
                    subtitle: Row(children: [
                      _controller
                          .getcontainertype(_controller.pokedex[index].type1),
                      _controller
                          .getcontainertype(_controller.pokedex[index].type2)
                    ]),
                  ),
                );
              },
            ),
          );
        });
  }
}
