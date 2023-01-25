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
  final Controller _controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pokemon.name} #${widget.pokemon.no}'),
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
                  Expanded(
                    flex: 1,
                    child: _controller.getcontainertype(widget.pokemon.type2),
                  )
                ],
              ),
            ),
            Expanded(
                child: _controller.calculatabla(
                    widget.pokemon.type1, widget.pokemon.type2),
                flex: 3)
          ],
        ),
      ),
    );
  }
}
