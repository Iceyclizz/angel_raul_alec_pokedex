import 'package:hive_flutter/hive_flutter.dart';
part 'type.g.dart';

@HiveType(typeId: 1)
enum TypeList {
  @HiveField(0)
  acero,
  @HiveField(1)
  agua,
  @HiveField(2)
  bicho,
  @HiveField(3)
  dragon,
  @HiveField(4)
  electrico,
  @HiveField(5)
  fantasma,
  @HiveField(6)
  fuego,
  @HiveField(7)
  hada,
  @HiveField(8)
  hielo,
  @HiveField(9)
  lucha,
  @HiveField(10)
  normal,
  @HiveField(11)
  planta,
  @HiveField(12)
  psiquico,
  @HiveField(13)
  roca,
  @HiveField(14)
  siniestro,
  @HiveField(15)
  tierra,
  @HiveField(16)
  veneno,
  @HiveField(17)
  volador
}
