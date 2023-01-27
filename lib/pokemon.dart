import 'dart:typed_data';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon {
  @HiveField(0)
  final int? no;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final TypeList type1;
  @HiveField(3)
  final TypeList? type2;
  @HiveField(4)
  String? image;
  @HiveField(5)
  final bool editable;

  Pokemon(
      {this.no,
      required this.name,
      required this.type1,
      this.type2,
      this.image,
      this.editable=false});
  TempPokemon pokemonToTempPokemon(){
    return TempPokemon(name: name, type1: type1,type2: type2,image: image,editable: true);
  }
}
class TempPokemon{
  String? name;
  TypeList? type1;
  TypeList? type2;
  String? image;
  bool editable;

  TempPokemon(
      {
      this.name,
      this.type1,
      this.type2,
      this.image,
      this.editable=false});
  Pokemon tempPokemonToPokemon(){
    return Pokemon(name: name!, type1: type1!,type2: type2,image: image,editable: true);
  }
}
