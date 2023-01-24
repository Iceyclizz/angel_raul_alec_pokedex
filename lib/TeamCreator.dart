import 'package:angel_raul_alec_pokedex/team.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

class teamCreator extends StatefulWidget {
  const teamCreator({Key? key}) : super(key: key);

  @override
  teamCreatorState createState() => teamCreatorState();
}

class teamCreatorState extends State<teamCreator> {
  final Controller miController = Controller();
  var nombreEquipo = '';
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
                    flex: 9,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa un nombre a tu equipo';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        nombreEquipo = value!;
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
                            var equipo1 = Team(
                                name: nombreEquipo,
                                equipopokemon: [
                                  miController.pokedex[1],
                                  miController.pokedex[12],
                                  miController.pokedex[20]
                                ]);
                            miController.equipo.add(equipo1);
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
                        onTap: () {},
                        child: const Card(
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
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: const Card(
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
                        ),
                      )),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: const Card(
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
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: const Card(
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
                        ),
                      )),
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: const Card(
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
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {},
                        child: const Card(
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
                        ),
                      )),
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
