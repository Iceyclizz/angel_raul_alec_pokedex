import 'package:angel_raul_alec_pokedex/model.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/team.dart';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:flutter/material.dart';

class Controller<T>{
  void addtolist(T pocketentity){

  }
  void updatelist(T pocketentity){
    
  }
  void deletefromlist(T pocketentity){
    
  }
  Future<void> initapp() async{
    Model().initapp();
  }
  List<Pokemon> get pokedex => Model().pokedex;
  set pokedex(List<Pokemon> value) {
    Model().pokedex = value;
  }
  List<Team> get equipo => Model().equipo;
  set equipo(List<Team> value) {
    Model().equipo = value;
  }
  Map<TypeList,Map<String,List<TypeList>>> get tipos => Model().tipos;
  set tipos(Map<TypeList,Map<String,List<TypeList>>> value) {
    Model().tipos = value;
  }
  Container getcontainertype(TypeList? type){
    final Color c;
    final String poketype;
    switch(type){
      case TypeList.acero:
      c = Colors.grey;
      break;
      case TypeList.agua:
      c = Colors.blue;
      break;
      case TypeList.bicho:
      c = Colors.green.shade900;
      break;
      case TypeList.dragon:
      c = Colors.indigo;
      break;
      case TypeList.electrico:
      c = Colors.yellow;
      break;
      case TypeList.fantasma:
      c = Colors.purple.shade900;
      break;
      case TypeList.fuego:
      c = Colors.red;
      break;
      case TypeList.hada:
      c = Colors.pink.shade200;
      break;
      case TypeList.hielo:
      c = Colors.blue.shade50;
      break;
      case TypeList.lucha:
      c = Colors.deepOrange;
      break;
      case TypeList.normal:
      c = Colors.grey.shade200;
      break;
      case TypeList.planta:
      c = Colors.green;
      break;
      case TypeList.psiquico:
      c = Colors.purple.shade200;
      break;
      case TypeList.roca:
      c = Colors.brown;
      break;
      case TypeList.siniestro:
      c = Colors.black87;
      break;
      case TypeList.tierra:
      c = Colors.orange.shade200;
      break;
      case TypeList.veneno:
      c = Colors.purple.shade800;
      break;
      case TypeList.volador:
      c = Colors.lightBlue.shade100;
      break;
      default:
      c = Colors.white;
      break;
    }
    if (type == null){
      poketype="";
    }else{
      poketype=type.name.toUpperCase();
    }
    return Container(color: c,child: Text(poketype),);
  }
}