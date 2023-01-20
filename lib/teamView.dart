import 'package:angel_raul_alec_pokedex/main.dart';
import 'package:flutter/material.dart';

class teamView extends StatefulWidget {
  const teamView({Key? key}) : super(key: key);

  @override
  _PokemonviewState createState() => _PokemonviewState();
}

class _PokemonviewState extends State<teamView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Team View'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 8.0),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pokedex()),
                ),
            tooltip: 'Add Item',
            child: Icon(Icons.add)),
        drawer: const Hamburgesa(ruta: '/teamView'));
  }
}
