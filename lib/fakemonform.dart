// ignore_for_file: sort_child_properties_last
import 'package:image_picker/image_picker.dart';
import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Fakemonform extends StatefulWidget {
  Fakemonform({Key? key, this.fakemon, this.index}) : super(key: key);
  final Pokemon? fakemon;
  final int? index;
  TempPokemon temppokemon = TempPokemon();
  @override
  _FakemonformState createState() => _FakemonformState();
}

class _FakemonformState extends State<Fakemonform> {
  final Controller<Pokemon> _controller = Controller<Pokemon>();
  String dropdownValue1 = ' ';
  String dropdownValue2 = ' ';
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.fakemon != null) {
        widget.temppokemon = widget.fakemon!.pokemonToTempPokemon();
        dropdownValue1 = widget.temppokemon.type1!.name.toUpperCase();
        if (widget.temppokemon.type2 != null) {
          dropdownValue2 = widget.temppokemon.type2!.name.toUpperCase();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [const Text('Fakemon Form'),IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              )],)
        
      ),
      body: Form(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: FormField<ByteData>(builder: (formFieldState) {
                return GestureDetector(
                  onTap: () async {
                    XFile? img = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    ByteData? imgbytes;
                    if (img != null) {
                      Uint8List uint8 = await img.readAsBytes();
                      imgbytes = ByteData.view(uint8.buffer);
                    }
                    setState(() {
                      if (imgbytes != null) {
                        widget.temppokemon.image = imgbytes;
                      }
                    });
                  },
                  child: getimage(widget.temppokemon),
                );
              }),
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                initialValue: widget.temppokemon.name,
                decoration:
                    const InputDecoration(label: Text("Nombre fakemon")),
                validator: (value) {
                  if (value == null || value == "") {
                    return "El fakemon debería tener nombre";
                  }
                  return null;
                },
                onSaved: (valor) => widget.temppokemon.name = valor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                      flex: 3,
                      child: FormField<TypeList>(
                        initialValue: gettypefromkey(dropdownValue1),
                        builder: (formFieldState) {
                          return DropdownButton<String>(
                            value: dropdownValue1,
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
                                dropdownValue1 = value!;
                                formFieldState.didChange(gettypefromkey(value));
                              });
                            },
                            items: gettypelistkeys()
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }).toList(),
                          );
                        },
                        validator: (value) {
                          if (value == null || value == ' ') {
                            return "El pokemon deberia tener un tipo primario";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) =>
                            widget.temppokemon.type1 = newValue,
                      )),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                      flex: 3,
                      child: FormField<TypeList>(
                        builder: (formFieldState) {
                          return DropdownButton<String>(
                            value: dropdownValue2,
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
                                dropdownValue2 = value!;
                                formFieldState.didChange(gettypefromkey(value));
                              });
                            },
                            items: gettypelistkeys()
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }).toList(),
                          );
                        },
                        onSaved: (newValue) =>
                            widget.temppokemon.type2 = newValue,
                      )),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  )
                ],
              ),
            ),
          ],
        ),
        key: _formKey,
      ),
      floatingActionButton: Column(
        children: [
          Expanded(
            child: Container(),
            flex: 7,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(), flex: 1),
                Expanded(
                    child: FloatingActionButton(
                        onPressed: () async {
                          if (await _controller.askUserDialog(
                              context, 'Seguro que quieres eliminar')) {
                            if (widget.index != null) {
                              _controller.deletefromlist(
                                  widget.temppokemon.tempPokemonToPokemon(),
                                  widget.index!);
                            }
                            Navigator.pop(context);
                          }
                        },
                        tooltip: 'Eliminar Tarea',
                        heroTag: null,
                        child: const Icon(Icons.delete)),
                    flex: 1),
                Expanded(child: Container(), flex: 1),
                Expanded(
                    child: FloatingActionButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            widget.index == null
                                ? _controller.addtolist(
                                    widget.temppokemon.tempPokemonToPokemon())
                                : _controller.updatelist(
                                    widget.temppokemon.tempPokemonToPokemon(),
                                    widget.index!);
                            Navigator.pop(context);
                          }
                        },
                        tooltip: 'Guardar Pokemon',
                        heroTag: null,
                        child: const Icon(Icons.save)),
                    flex: 1),
                Expanded(child: Container(), flex: 1),
              ],
            ),
            flex: 1,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getimage(TempPokemon f) {
    if (f.image != null) {
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

  List<String> gettypelistkeys() {
    List<String> typelistkeys = <String>[];
    typelistkeys.add(' ');
    for (TypeList t in Controller().tipos.keys) {
      typelistkeys.add(t.name.toUpperCase());
    }
    return typelistkeys;
  }

  TypeList? gettypefromkey(String tipo) {
    for (TypeList t in Controller().tipos.keys) {
      if (t.name.toUpperCase() == tipo) {
        return t;
      }
    }
    return null;
  }
}
