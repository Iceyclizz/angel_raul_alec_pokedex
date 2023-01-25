import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:flutter/material.dart';

class Pokemonview extends StatefulWidget {
  const Pokemonview({Key? key, required this.pokemon, required this.index}) : super(key: key);
  final Pokemon pokemon;
  final int index;
  @override
  _PokemonviewState createState() => _PokemonviewState();
}

class _PokemonviewState extends State<Pokemonview> {
  final Controller _controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${(widget.pokemon.no==null?"":"#${widget.pokemon.no} ")}${widget.pokemon.name}'),
      ),
      body: Card(
        child: Column(
          children: [
            if (widget.pokemon.image != null)
              Expanded(
                flex: 4,
                child: Image.memory(
                  widget.pokemon.image!.buffer.asUint8List(
                      widget.pokemon.image!.offsetInBytes,
                      widget.pokemon.image!.lengthInBytes),
                ),
              ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _controller.getcontainertype(widget.pokemon.type1),
                  ),
                  if(widget.pokemon.type2!=null)
                  Expanded(
                    flex: 1,
                    child: _controller.getcontainertype(widget.pokemon.type2),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: calculatabla(
                    widget.pokemon.type1, widget.pokemon.type2))
          ],
        ),
      ),
      floatingActionButton: 
      widget.pokemon.editable?
      FloatingActionButton(onPressed: () async{
        await Navigator.pushNamed(context, "/fakemon/edit",
                                  arguments: {"objeto": _controller.fakemon[widget.index], "index": widget.index});
                              setState(() {});
      },
              tooltip: 'Editar fakemon',
              child: const Icon(Icons.edit),):null
    );
  }
  Widget calculatabla(TypeList? tipo1, TypeList? tipo2) {
    Controller controller=Controller();
    var tablatipos = <TypeList, double>{};
    for (TypeList i in controller.tipos[tipo1]!['superefective']!) {
      tablatipos[i] = (tablatipos[i] ?? 1) * 2;
    }
    
    for (TypeList i in controller.tipos[tipo1]!['resistant']!) {
      tablatipos[i] = (tablatipos[i] ?? 1) * 0.5;
    }
    
    for (TypeList i in controller.tipos[tipo1]!['immunities']!) {
      tablatipos[i] = (tablatipos[i] ?? 1) * 0;
    }
    if(tipo2!=null){
    for (TypeList i in controller.tipos[tipo2]!['immunities']!) {
      tablatipos[i] = (tablatipos[i] ?? 1) * 0;
    }
    for (TypeList i in controller.tipos[tipo2]!['resistant']!) {
      tablatipos[i] = (tablatipos[i] ?? 1) * 0.5;
    }
for (TypeList i in controller.tipos[tipo2]!['superefective']!) {
      tablatipos[i] = (tablatipos[i] ?? 1) * 2;
    }}
    return Row(
      children: [
        if(tablatipos.values.contains(4))
        Expanded(
            flex: 1,
            child: Card(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('x4'),
                  ),
                  for (TypeList i in tablatipos.keys)
                    if (tablatipos[i] == 4)
                      ListTile(
                        title: controller.getcontainertype(i,view: true),
                      )
                ],
              ),
            )),
            if(tablatipos.values.contains(2))
        Expanded(
            flex: 1,
            child: Card(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('x2'),
                  ),
                  for (TypeList i in tablatipos.keys)
                    if (tablatipos[i] == 2)
                      ListTile(
                        title: controller.getcontainertype(i,view: true),
                      )
                ],
              ),
            )),
            if(tablatipos.values.contains(0.5))
        Expanded(
            flex: 1,
            child: Card(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('x0.5'),
                  ),
                  for (TypeList i in tablatipos.keys)
                    if (tablatipos[i] == 0.5)
                      ListTile(
                        title: controller.getcontainertype(i,view: true),
                      )
                ],
              ),
            )),
            if(tablatipos.values.contains(0.25))
        Expanded(
            flex: 1,
            child: Card(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('x0.25'),
                  ),
                  for (TypeList i in tablatipos.keys)
                    if (tablatipos[i] == 0.25)
                      ListTile(
                        title: controller.getcontainertype(i,view: true),
                      )
                ],
              ),
            )),
            if(tablatipos.values.contains(0))
        Expanded(
            flex: 1,
            child: Card(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('x0'),
                  ),
                  for (TypeList i in tablatipos.keys)
                    if (tablatipos[i] == 0)
                      ListTile(
                        title: controller.getcontainertype(i,view: true),
                      )
                ],
              ),
            ))
      ],
    );
  }
}
