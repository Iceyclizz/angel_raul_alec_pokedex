import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/team.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

class teamCreator extends StatefulWidget {
  teamCreator({Key? key, this.team, this.index}) : super(key: key);
  final Team? team;
  final int? index;
  TempTeam equipoTemporal = TempTeam(equipopokemon: <Pokemon>[]);
  @override
  teamCreatorState createState() => teamCreatorState();
}

class teamCreatorState extends State<teamCreator> {
  final Controller<Team> miController = Controller<Team>();
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.team != null) {
        widget.equipoTemporal = widget.team!.tempTeamConverter();
      }
    });
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Team Creator'),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Card(
                      color: Colors.black,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (await miController.askUserDialog(
                              context, 'Seguro que quieres eliminar')) {
                            if (widget.index != null) {
                              miController.deletefromlist(
                                  widget.equipoTemporal.teamConverter(),
                                  widget.index!);
                            }
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      initialValue: widget.equipoTemporal.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa un nombre a tu equipo';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        widget.equipoTemporal.name = value!;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      color: Colors.black,
                      child: IconButton(
                        icon: const Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (_formkey.currentState != null &&
                              _formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            if (widget.index != null) {
                              miController.updatelist(
                                  widget.equipoTemporal.teamConverter(),
                                  widget.index!);
                            } else {
                              miController.addtolist(
                                  widget.equipoTemporal.teamConverter());
                            }
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 13,
                child: Column(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, '/pokemonPicker/edit', arguments: {
                            "objeto": widget.equipoTemporal.equipopokemon,
                            "index": 0
                          });
                          setState(() {});
                        },
                        child: getimage(
                            widget.equipoTemporal.equipopokemon.isNotEmpty
                                ? widget.equipoTemporal.equipopokemon[0]
                                : null),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, '/pokemonPicker/edit', arguments: {
                            "objeto": widget.equipoTemporal.equipopokemon,
                            "index": 1
                          });
                          setState(() {});
                        },
                        child: getimage(
                            widget.equipoTemporal.equipopokemon.length > 1
                                ? widget.equipoTemporal.equipopokemon[1]
                                : null),
                      )),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, '/pokemonPicker/edit', arguments: {
                            "objeto": widget.equipoTemporal.equipopokemon,
                            "index": 2
                          });
                          setState(() {});
                        },
                        child: getimage(
                            widget.equipoTemporal.equipopokemon.length > 2
                                ? widget.equipoTemporal.equipopokemon[2]
                                : null),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, '/pokemonPicker/edit', arguments: {
                            "objeto": widget.equipoTemporal.equipopokemon,
                            "index": 3
                          });
                          setState(() {});
                        },
                        child: getimage(
                            widget.equipoTemporal.equipopokemon.length > 3
                                ? widget.equipoTemporal.equipopokemon[3]
                                : null),
                      )),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, '/pokemonPicker/edit', arguments: {
                            "objeto": widget.equipoTemporal.equipopokemon,
                            "index": 4
                          });
                          setState(() {});
                        },
                        child: getimage(
                            widget.equipoTemporal.equipopokemon.length > 4
                                ? widget.equipoTemporal.equipopokemon[4]
                                : null),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, '/pokemonPicker/edit', arguments: {
                            "objeto": widget.equipoTemporal.equipopokemon,
                            "index": 5
                          });
                          setState(() {});
                        },
                        child: getimage(
                            widget.equipoTemporal.equipopokemon.length > 5
                                ? widget.equipoTemporal.equipopokemon[5]
                                : null),
                      )),
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }

  Widget getimage(Pokemon? f) {
    if (f != null && f.image != null) {
      return Card(
          color: Colors.grey,
          child: Center(
            child: Image.memory(
              f.image!.buffer
                  .asUint8List(f.image!.offsetInBytes, f.image!.lengthInBytes),
              fit: BoxFit.fill,
            ),
          ));
    } else {
      return const Card(
        color: Colors.grey,
        child: Center(
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
}
