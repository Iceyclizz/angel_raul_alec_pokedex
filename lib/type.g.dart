// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonTypeAdapter extends TypeAdapter<PokemonType> {
  @override
  final int typeId = 1;

  @override
  PokemonType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonType(
      name: fields[0] as TypeList,
      debilidades: (fields[1] as List).cast<TypeList>(),
      resistencia: (fields[2] as List).cast<TypeList>(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.debilidades)
      ..writeByte(2)
      ..write(obj.resistencia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypeListAdapter extends TypeAdapter<TypeList> {
  @override
  final int typeId = 3;

  @override
  TypeList read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeList.acero;
      case 1:
        return TypeList.agua;
      case 2:
        return TypeList.bicho;
      case 3:
        return TypeList.dragon;
      case 4:
        return TypeList.electrico;
      case 5:
        return TypeList.fantasma;
      case 6:
        return TypeList.fuego;
      case 7:
        return TypeList.hada;
      case 8:
        return TypeList.hielo;
      case 9:
        return TypeList.lucha;
      case 10:
        return TypeList.normal;
      case 11:
        return TypeList.planta;
      case 12:
        return TypeList.psiquico;
      case 13:
        return TypeList.roca;
      case 14:
        return TypeList.siniestro;
      case 15:
        return TypeList.tierra;
      case 16:
        return TypeList.veneno;
      case 17:
        return TypeList.volador;
      default:
        return TypeList.acero;
    }
  }

  @override
  void write(BinaryWriter writer, TypeList obj) {
    switch (obj) {
      case TypeList.acero:
        writer.writeByte(0);
        break;
      case TypeList.agua:
        writer.writeByte(1);
        break;
      case TypeList.bicho:
        writer.writeByte(2);
        break;
      case TypeList.dragon:
        writer.writeByte(3);
        break;
      case TypeList.electrico:
        writer.writeByte(4);
        break;
      case TypeList.fantasma:
        writer.writeByte(5);
        break;
      case TypeList.fuego:
        writer.writeByte(6);
        break;
      case TypeList.hada:
        writer.writeByte(7);
        break;
      case TypeList.hielo:
        writer.writeByte(8);
        break;
      case TypeList.lucha:
        writer.writeByte(9);
        break;
      case TypeList.normal:
        writer.writeByte(10);
        break;
      case TypeList.planta:
        writer.writeByte(11);
        break;
      case TypeList.psiquico:
        writer.writeByte(12);
        break;
      case TypeList.roca:
        writer.writeByte(13);
        break;
      case TypeList.siniestro:
        writer.writeByte(14);
        break;
      case TypeList.tierra:
        writer.writeByte(15);
        break;
      case TypeList.veneno:
        writer.writeByte(16);
        break;
      case TypeList.volador:
        writer.writeByte(17);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
