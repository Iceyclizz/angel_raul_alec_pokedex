import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class FakemonView extends StatefulWidget {
  const FakemonView({Key? key}) : super(key: key);

  @override
  _FakemonViewState createState() => _FakemonViewState();
}

class _FakemonViewState extends State<FakemonView> {
  final Controller _controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fakemon'),
        ),
        body: ListView.builder(
          itemCount: _controller.fakemon.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(children: [
                if (_controller.fakemon[index].image != null)
                  Image.memory(
                      _controller.fakemon[index].image!.buffer.asUint8List(
                          _controller.fakemon[index].image!.offsetInBytes,
                          _controller.fakemon[index].image!.lengthInBytes),
                      scale: 10),
                Card(
                  child: Text("#${_controller.fakemon[index].no}"
                      "\t"
                      "${_controller.fakemon[index].name}"),
                )
              ]),
              subtitle: Row(children: [
                _controller.getcontainertype(_controller.fakemon[index].type1),
                _controller.getcontainertype(_controller.fakemon[index].type2)
              ]),
            );
          },
        ),
        drawer: const Hamburgesa(ruta: '/fakemon'),
        floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed("/fakemon/new");
                setState(() {});
              },
              tooltip: 'Afegir fakemon',
              child: const Icon(Icons.add),
            ),
        );
  }
}
