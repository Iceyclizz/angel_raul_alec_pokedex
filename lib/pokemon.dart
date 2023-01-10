import 'dart:html';
import 'package:hive_flutter/hive_flutter.dart';
part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon{
  @HiveField(0)
  final int? no;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final type1;
  @HiveField(3)
  final type2;
  @HiveField(4)
  final Blob? image;

  Pokemon(
      {this.no,
      required this.name,
      required this.type1,
      this.type2,
      this.image});
}