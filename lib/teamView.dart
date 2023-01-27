import 'dart:convert';

import 'package:angel_raul_alec_pokedex/main.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

class teamView extends StatefulWidget {
  const teamView({Key? key}) : super(key: key);

  @override
  _PokemonviewState createState() => _PokemonviewState();
}

class _PokemonviewState extends State<teamView> {
  final Controller miController = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Team View'),
        ),
        body: ListView.builder(
          itemCount: miController.equipo.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Row(children: [
                if (miController.equipo[index].equipopokemon != null)
                  for (Pokemon p in miController.equipo[index].equipopokemon)
                    Image.memory(base64Decode(p.image!), scale: 10),
              ]),
              subtitle: Text(miController.equipo[index].name),
              onTap: () async {
                await Navigator.pushNamed(context, '/teamCreator/edit',
                    arguments: {
                      "objeto": miController.equipo[index],
                      "index": index
                    });
                setState(() {});
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/teamCreator');
              setState(() {});
            },
            tooltip: 'Add Item',
            child: const Icon(Icons.add)),
        drawer: const Hamburgesa(ruta: '/teamView'));
  }
}
