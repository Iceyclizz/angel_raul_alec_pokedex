// ignore_for_file: sort_child_properties_last

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
  final List<String> dropdown= <String>['Originales','Creados'];
  final Controller _controller = Controller();
  List<Pokemon> listaUpdateable = Controller().pokedex;
  String dropdownValue = 'Originales';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.initapp(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Row(children: [
          const Expanded(flex: 9,child: Text('Pokedex'),)
          ,Expanded(child:IconButton(
                icon: const Icon(Icons.delete),
                onPressed: (){
if (widget.equipoPokemon != null &&
                        widget.equipoPokemon!.length >= widget.index + 1) {
                      widget.equipoPokemon?.removeAt(widget.index);
                    }
                    Navigator.pop(context);
                },
                alignment: Alignment.centerRight,
              ) ,flex: 1,)
          ],),
            ),
            body: Column(children: [Expanded(child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.blue),
                            underline: Container(
                              height: 2,
                              color: Colors.blueAccent,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                                switch(value){
                                  case 'Originales':
                                  listaUpdateable=_controller.pokedex;
                                  break;
                                  case 'Creados':
                                  listaUpdateable=_controller.fakemon;
                                  break;
                                  default:break;
                                }
                              });
                            },
                            items: dropdown
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }).toList(),
                          ),flex: 1,),
                          Expanded(child: ListView.builder(
              itemCount: listaUpdateable.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (widget.equipoPokemon != null &&
                        widget.equipoPokemon!.length >= widget.index + 1) {
                      widget.equipoPokemon?.removeAt(widget.index);
                      widget.equipoPokemon?.add(listaUpdateable[index]);
                    } else {
                      widget.equipoPokemon?.add(listaUpdateable[index]);
                    }
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Row(children: [
                      if (listaUpdateable[index].image != null)
                        Image.memory(
                          base64Decode(listaUpdateable[index].image!),
                            scale: 10),
                      Card(
                        child: Text('${(listaUpdateable[index].no==null?"":"#${listaUpdateable[index].no} ")}${listaUpdateable[index].name}'),
                      )
                    ]),
                    subtitle: Row(children: [
                      _controller
                          .getcontainertype(listaUpdateable[index].type1),
                      _controller
                          .getcontainertype(listaUpdateable[index].type2)
                    ]),
                  ),
                );
              },
            ),flex: 9,)
                          ],)
            
          );
        });
  }
}
