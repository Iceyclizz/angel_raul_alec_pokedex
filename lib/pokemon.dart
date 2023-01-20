import 'dart:typed_data';
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
  ByteData? image;
  @HiveField(5)
  final bool editable;

  Pokemon(
      {this.no,
      required this.name,
      required this.type1,
      this.type2,
      this.image,
      this.editable=false});
}