import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/fakemonlist.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/pokemonPicker.dart';
import 'package:angel_raul_alec_pokedex/pokemonView.dart';
import 'package:angel_raul_alec_pokedex/team.dart';
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
        '/fakemon/new': (context) => Fakemonform(),
        '/teamCreator': (context) => teamCreator(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/pokemonView':
            return MaterialPageRoute(
              builder: (context) => Pokemonview(
                  pokemon: (settings.arguments as Map)["objeto"] as Pokemon,
                  index: (settings.arguments as Map)["index"] as int),
            );
          case '/fakemon/edit':
            return MaterialPageRoute(
              builder: (context) => Fakemonform(
                fakemon: (settings.arguments as Map)["objeto"] as Pokemon,
                index: (settings.arguments as Map)["index"] as int,
              ),
            );
          case '/teamCreator/edit':
            return MaterialPageRoute(
              builder: (context) => teamCreator(
                team: (settings.arguments as Map)["objeto"] as Team,
                index: (settings.arguments as Map)["index"] as int,
              ),
            );
          case '/pokemonPicker/edit':
            return MaterialPageRoute(
              builder: (context) => pokemonPicker(
                equipoPokemon: (settings.arguments as Map)["objeto"] as List<Pokemon>,
                index: (settings.arguments as Map)["index"] as int,
              ),
            );
          default:
            return null;
        }
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
                      arguments: {
                        "objeto": _controller.pokedex[index],
                        "index": index
                      }),
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
            color: Color.fromARGB(255, 36, 36, 36),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2a5c0ce5-7c29-462a-9766-844d53740d29/ddxh1ev-ef744da4-00ec-4f01-a4e7-2b4ea5958893.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzJhNWMwY2U1LTdjMjktNDYyYS05NzY2LTg0NGQ1Mzc0MGQyOVwvZGR4aDFldi1lZjc0NGRhNC0wMGVjLTRmMDEtYTRlNy0yYjRlYTU5NTg4OTMuZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bjqN7xDqDcq9zEc7IfTm6Cy_8RGRpy-W1HvKcUAs8aA'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Text(
            'Menu',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.format_list_numbered_outlined,
          ),
          title: const Text('Pokédex', style: TextStyle(fontSize: 19)),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromARGB(255, 36, 36, 36),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          onTap: () {
            if (ruta == '/') {
              Navigator.pop(context);
            } else {
              Navigator.popAndPushNamed(context, '/');
            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.list_alt,
          ),
          title:
              const Text('Creador de equipo', style: TextStyle(fontSize: 19)),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromARGB(255, 36, 36, 36),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          onTap: () {
            if (ruta == '/teamView') {
              Navigator.pop(context);
            } else {
              Navigator.popAndPushNamed(context, '/teamView');
            }
          },
        ),
        ListTile(
          leading: Icon(
            Icons.handyman,
          ),
          title: const Text('Fakemon', style: TextStyle(fontSize: 19)),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromARGB(255, 36, 36, 36),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
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
