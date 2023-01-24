import 'package:angel_raul_alec_pokedex/model.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/team.dart';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:flutter/material.dart';

class Controller<T> {
  void addtolist(T pocketentity) {}
  void updatelist(T pocketentity) {}
  void deletefromlist(T pocketentity) {}
  Future<void> initapp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Model().initapp();
  }

  List<Pokemon> get pokedex => Model().pokedex;
  set pokedex(List<Pokemon> value) {
    Model().pokedex = value;
  }

  List<Pokemon> get fakemon => Model().fakemon;
  set fakemon(List<Pokemon> value) {
    Model().fakemon = value;
  }

  List<Team> get equipo => Model().equipo;
  set equipo(List<Team> value) {
    Model().equipo = value;
  }

  Map<TypeList, Map<String, List<TypeList>>> get tipos => Model().tipos;
  set tipos(Map<TypeList, Map<String, List<TypeList>>> value) {
    Model().tipos = value;
  }

  Container getcontainertype(TypeList? type) {
    final Color containerColor;
    Color textColor = Colors.black;
    final String poketype;
    switch (type) {
      case TypeList.acero:
        containerColor = Colors.grey;
        break;
      case TypeList.agua:
        containerColor = Colors.blue;
        break;
      case TypeList.bicho:
        containerColor = Colors.green.shade900;
        textColor = Colors.white;
        break;
      case TypeList.dragon:
        containerColor = Colors.indigo;
        textColor = Colors.white;
        break;
      case TypeList.electrico:
        containerColor = Colors.yellow;
        break;
      case TypeList.fantasma:
        containerColor = Colors.purple.shade900;
        textColor = Colors.white;
        break;
      case TypeList.fuego:
        containerColor = Colors.red;
        break;
      case TypeList.hada:
        containerColor = Colors.pink.shade200;
        break;
      case TypeList.hielo:
        containerColor = Colors.blue.shade50;
        break;
      case TypeList.lucha:
        containerColor = Colors.deepOrange;
        break;
      case TypeList.normal:
        containerColor = Colors.grey.shade200;
        break;
      case TypeList.planta:
        containerColor = Colors.green;
        break;
      case TypeList.psiquico:
        containerColor = Colors.purple.shade200;
        break;
      case TypeList.roca:
        containerColor = Colors.brown;
        textColor = Colors.white;
        break;
      case TypeList.siniestro:
        containerColor = Colors.black87;
        textColor = Colors.white;
        break;
      case TypeList.tierra:
        containerColor = Colors.orange.shade200;
        break;
      case TypeList.veneno:
        containerColor = Colors.purple.shade800;
        textColor = Colors.white;
        break;
      case TypeList.volador:
        containerColor = Colors.lightBlue.shade100;
        break;
      default:
        containerColor = Colors.white;
        break;
    }
    if (type == null) {
      poketype = "";
    } else {
      poketype = type.name.toUpperCase();
    }
    return Container(
      color: containerColor,
      padding: const EdgeInsets.all(3.0),
      child: Text(
        poketype,
        style: TextStyle(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
