import 'package:angel_raul_alec_pokedex/controller.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:flutter/material.dart';

class Fakemonform extends StatefulWidget {
  const Fakemonform({Key? key, required this.fakemon}) : super(key: key);
  final Pokemon fakemon;
  @override
  _FakemonformState createState() => _FakemonformState();
}

class _FakemonformState extends State<Fakemonform> {
  final Controller _controller = Controller();
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fakemon Form'),
      ),
      body: Column(
        children: [
          GestureDetector(),
          TextFormField(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownButton<String>(
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
                    });
                  },
                  items: _controller.tipos.keys
                      .map<DropdownMenuItem<String>>((TypeList value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: DropdownButton<String>(
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
                    });
                  },
                  items: _controller.tipos.keys
                      .map<DropdownMenuItem<String>>((TypeList value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
