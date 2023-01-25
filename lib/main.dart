import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/fakemonlist.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/pokemonView.dart';
import 'package:angel_raul_alec_pokedex/teamView.dart';
import 'package:flutter/material.dart';

import 'fakemonform.dart';
import 'TeamCreator.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Chilena',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Pokedex(),
        '/fakemon': (context) => const FakemonView(),
        '/teamView': (context) => const teamView(),
        '/fakemon/new':(context) => Fakemonform(),
        '/teamCreator': (context) => const teamCreator(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/pokemonView':
            return MaterialPageRoute(
              builder: (context) =>
                  Pokemonview(pokemon: settings.arguments as Pokemon),
            );
            case '/fakemon/edit':
            return MaterialPageRoute(
              builder: (context) =>
                  Fakemonform(fakemon: (settings.arguments as Map)["objeto"] as Pokemon,index: (settings.arguments as Map)["index"] as int,),
            );
          default:
          return null;
        }
        return null;
      },
    );
  }
}

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final Controller _controller = Controller();
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
                  onTap: () => Navigator.pushNamed(context, '/pokemonView',
                      arguments: _controller.pokedex[index]),
                  child: ListTile(
                    title: Row(children: [
                      if (_controller.pokedex[index].image != null)
                        Image.memory(
                            _controller.pokedex[index].image!.buffer
                                .asUint8List(
                                    _controller
                                        .pokedex[index].image!.offsetInBytes,
                                    _controller
                                        .pokedex[index].image!.lengthInBytes),
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
            drawer: const Hamburgesa(ruta: '/'),
          );
        });
  }
}

class Hamburgesa extends StatelessWidget {
  const Hamburgesa({Key? key, required this.ruta}) : super(key: key);
  final String ruta;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text('Menu'),
        ),
        ListTile(
          title: const Text('Pokédex'),
          onTap: () {
            if (ruta == '/') {
              Navigator.pop(context);
            } else {
              Navigator.popAndPushNamed(context, '/');
            }
          },
        ),
        ListTile(
          title: const Text('Creador de equipo'),
          onTap: () {
            if (ruta == '/teamView') {
              Navigator.pop(context);
            } else {
              Navigator.popAndPushNamed(context, '/teamView');
            }
          },
        ),
        ListTile(
          title: const Text('Fakemon'),
          onTap: () {
            if (ruta == '/fakemon') {
              Navigator.pop(context);
            } else {
              Navigator.popAndPushNamed(context, '/fakemon');
            }
          },
        ),
      ],
    ));
  }
}
