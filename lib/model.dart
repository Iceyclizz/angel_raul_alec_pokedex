import 'dart:convert';

import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/team.dart';
import 'package:angel_raul_alec_pokedex/type.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Model {
  static final Model _model = Model._internal();

  factory Model() {
    return _model;
  }

  Model._internal();
  List<Team> equipo = <Team>[];
  bool initialized = false;
  Map<TypeList, Map<String, List<TypeList>>> tipos = <TypeList, Map<String, List<TypeList>>>{
    TypeList.acero: {
      'superefective': [TypeList.fuego, TypeList.lucha, TypeList.tierra],
      'resistant': [
        TypeList.acero,
        TypeList.bicho,
        TypeList.dragon,
        TypeList.hada,
        TypeList.hielo,
        TypeList.normal,
        TypeList.planta,
        TypeList.psiquico,
        TypeList.roca,
        TypeList.volador
      ],
      'immunities': [TypeList.veneno]
    },
    TypeList.agua: {
      'superefective': [TypeList.electrico, TypeList.planta],
      'resistant': [
        TypeList.acero,
        TypeList.agua,
        TypeList.fuego,
        TypeList.hielo
      ],
      'immunities': []
    },
    TypeList.bicho: {
      'superefective': [TypeList.fuego, TypeList.roca, TypeList.volador],
      'resistant': [TypeList.lucha, TypeList.planta, TypeList.tierra],
      'immunities': []
    },
    TypeList.dragon: {
      'superefective': [TypeList.dragon, TypeList.hada, TypeList.hielo],
      'resistant': [
        TypeList.agua,
        TypeList.electrico,
        TypeList.fuego,
        TypeList.planta
      ],
      'immunities': []
    },
    TypeList.electrico: {
      'superefective': [TypeList.tierra],
      'resistant': [TypeList.acero, TypeList.electrico, TypeList.volador],
      'immunities': []
    },
    TypeList.fantasma: {
      'superefective': [TypeList.fantasma, TypeList.siniestro],
      'resistant': [TypeList.bicho, TypeList.veneno],
      'immunities': [TypeList.lucha, TypeList.normal]
    },
    TypeList.fuego: {
      'superefective': [TypeList.agua, TypeList.roca, TypeList.tierra],
      'resistant': [
        TypeList.acero,
        TypeList.bicho,
        TypeList.fuego,
        TypeList.hada,
        TypeList.hielo,
        TypeList.planta
      ],
      'immunities': []
    },
    TypeList.hada: {
      'superefective': [TypeList.hada, TypeList.veneno],
      'resistant': [TypeList.bicho, TypeList.lucha, TypeList.siniestro],
      'immunities': [TypeList.dragon]
    },
    TypeList.hielo: {
      'superefective': [
        TypeList.acero,
        TypeList.fuego,
        TypeList.lucha,
        TypeList.roca
      ],
      'resistant': [TypeList.hielo],
      'immunities': []
    },
    TypeList.lucha: {
      'superefective': [TypeList.hada, TypeList.psiquico, TypeList.volador],
      'resistant': [TypeList.bicho, TypeList.roca, TypeList.siniestro],
      'immunities': []
    },
    TypeList.normal: {
      'superefective': [TypeList.lucha],
      'resistant': [],
      'immunities': [TypeList.fantasma]
    },
    TypeList.planta: {
      'superefective': [
        TypeList.bicho,
        TypeList.fuego,
        TypeList.hielo,
        TypeList.veneno,
        TypeList.volador
      ],
      'resistant': [
        TypeList.agua,
        TypeList.electrico,
        TypeList.planta,
        TypeList.tierra
      ],
      'immunities': []
    },
    TypeList.psiquico: {
      'superefective': [TypeList.bicho, TypeList.fantasma, TypeList.siniestro],
      'resistant': [TypeList.lucha, TypeList.psiquico],
      'immunities': []
    },
    TypeList.roca: {
      'superefective': [
        TypeList.acero,
        TypeList.agua,
        TypeList.lucha,
        TypeList.planta,
        TypeList.tierra
      ],
      'resistant': [
        TypeList.fuego,
        TypeList.normal,
        TypeList.veneno,
        TypeList.volador
      ],
      'immunities': []
    },
    TypeList.siniestro: {
      'superefective': [TypeList.bicho, TypeList.hada, TypeList.lucha],
      'resistant': [TypeList.fantasma, TypeList.siniestro],
      'immunities': [TypeList.psiquico]
    },
    TypeList.tierra: {
      'superefective': [TypeList.agua, TypeList.hielo, TypeList.planta],
      'resistant': [TypeList.roca, TypeList.veneno],
      'immunities': [TypeList.electrico]
    },
    TypeList.veneno: {
      'superefective': [TypeList.psiquico, TypeList.tierra],
      'resistant': [
        TypeList.bicho,
        TypeList.hada,
        TypeList.lucha,
        TypeList.planta,
        TypeList.veneno
      ],
      'immunities': []
    },
    TypeList.volador: {
      'superefective': [TypeList.electrico, TypeList.hielo, TypeList.roca],
      'resistant': [TypeList.bicho, TypeList.lucha, TypeList.planta],
      'immunities': [TypeList.tierra]
    }
  };
  List<Pokemon> fakemon = <Pokemon>[];
  List<Pokemon> pokedex = <Pokemon>[
    Pokemon(
        no: 1,
        name: 'Bulbasur',
        type1: TypeList.planta,
        type2: TypeList.veneno),
    Pokemon(
        no: 2, name: 'Ivysaur', type1: TypeList.planta, type2: TypeList.veneno),
    Pokemon(
        no: 3,
        name: 'Venusaur',
        type1: TypeList.planta,
        type2: TypeList.veneno),
    Pokemon(no: 4, name: 'Charmander', type1: TypeList.fuego),
    Pokemon(no: 5, name: 'Charmeleon', type1: TypeList.fuego),
    Pokemon(
        no: 6,
        name: 'Charizard',
        type1: TypeList.fuego,
        type2: TypeList.volador),
    Pokemon(no: 7, name: 'Squirtle', type1: TypeList.agua),
    Pokemon(no: 8, name: 'Wartortle', type1: TypeList.agua),
    Pokemon(no: 9, name: 'Blastoise', type1: TypeList.agua),
    Pokemon(no: 10, name: 'Caterpie', type1: TypeList.bicho),
    Pokemon(no: 11, name: 'Metapod', type1: TypeList.bicho),
    Pokemon(
        no: 12,
        name: 'Butterfree',
        type1: TypeList.bicho,
        type2: TypeList.volador),
    Pokemon(
        no: 13, name: 'Weedle', type1: TypeList.bicho, type2: TypeList.veneno),
    Pokemon(
        no: 14, name: 'Kakuna', type1: TypeList.bicho, type2: TypeList.veneno),
    Pokemon(
        no: 15,
        name: 'Beedrill',
        type1: TypeList.bicho,
        type2: TypeList.veneno),
    Pokemon(
        no: 16,
        name: 'Pidgey',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(
        no: 17,
        name: 'Pidgeotto',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(
        no: 18,
        name: 'Pidgeot',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(no: 19, name: 'Rattata', type1: TypeList.normal),
    Pokemon(no: 20, name: 'Raticate', type1: TypeList.normal),
    Pokemon(
        no: 21,
        name: 'Spearow',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(
        no: 22,
        name: 'Fearow',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(no: 23, name: 'Ekans', type1: TypeList.veneno),
    Pokemon(no: 24, name: 'Arbok', type1: TypeList.veneno),
    Pokemon(no: 25, name: 'Pikachu', type1: TypeList.electrico),
    Pokemon(no: 26, name: 'Raichu', type1: TypeList.electrico),
    Pokemon(no: 27, name: 'Sandshrew', type1: TypeList.tierra),
    Pokemon(no: 28, name: 'Sandslash', type1: TypeList.tierra),
    Pokemon(no: 29, name: 'Nidoran♀', type1: TypeList.veneno),
    Pokemon(no: 30, name: 'Nidorina', type1: TypeList.veneno),
    Pokemon(
        no: 31,
        name: 'Nidoqueen',
        type1: TypeList.veneno,
        type2: TypeList.tierra),
    Pokemon(no: 32, name: 'Nidoran♂', type1: TypeList.veneno),
    Pokemon(no: 33, name: 'Nidorino', type1: TypeList.veneno),
    Pokemon(
        no: 34,
        name: 'Nidoking',
        type1: TypeList.veneno,
        type2: TypeList.tierra),
    Pokemon(no: 35, name: 'Clefairy', type1: TypeList.hada),
    Pokemon(no: 36, name: 'Clefable', type1: TypeList.hada),
    Pokemon(no: 37, name: 'Vulpix', type1: TypeList.fuego),
    Pokemon(no: 38, name: 'Ninetales', type1: TypeList.fuego),
    Pokemon(
        no: 39,
        name: 'Jigglypuff',
        type1: TypeList.normal,
        type2: TypeList.hada),
    Pokemon(
        no: 40,
        name: 'Wigglytuff',
        type1: TypeList.normal,
        type2: TypeList.hada),
    Pokemon(
        no: 41, name: 'Zubat', type1: TypeList.veneno, type2: TypeList.volador),
    Pokemon(
        no: 42,
        name: 'Golbat',
        type1: TypeList.veneno,
        type2: TypeList.volador),
    Pokemon(
        no: 43, name: 'Oddish', type1: TypeList.planta, type2: TypeList.veneno),
    Pokemon(
        no: 44, name: 'Gloom', type1: TypeList.planta, type2: TypeList.veneno),
    Pokemon(
        no: 45,
        name: 'Vileplume',
        type1: TypeList.planta,
        type2: TypeList.veneno),
    Pokemon(
        no: 46, name: 'Paras', type1: TypeList.bicho, type2: TypeList.planta),
    Pokemon(
        no: 47,
        name: 'Parasect',
        type1: TypeList.bicho,
        type2: TypeList.planta),
    Pokemon(
        no: 48, name: 'Venonat', type1: TypeList.bicho, type2: TypeList.veneno),
    Pokemon(
        no: 49,
        name: 'Venomoth',
        type1: TypeList.bicho,
        type2: TypeList.veneno),
    Pokemon(no: 50, name: 'Diglett', type1: TypeList.tierra),
    Pokemon(no: 51, name: 'Dugtrio', type1: TypeList.tierra),
    Pokemon(no: 52, name: 'Meowth', type1: TypeList.normal),
    Pokemon(no: 53, name: 'Persian', type1: TypeList.normal),
    Pokemon(no: 54, name: 'Psyduck', type1: TypeList.agua),
    Pokemon(no: 55, name: 'Golduck', type1: TypeList.agua),
    Pokemon(no: 56, name: 'Mankey', type1: TypeList.lucha),
    Pokemon(no: 57, name: 'Primeape', type1: TypeList.lucha),
    Pokemon(no: 58, name: 'Growlithe', type1: TypeList.fuego),
    Pokemon(no: 59, name: 'Arcanine', type1: TypeList.fuego),
    Pokemon(no: 60, name: 'Poliwag', type1: TypeList.agua),
    Pokemon(no: 61, name: 'Poliwhirl', type1: TypeList.agua),
    Pokemon(
        no: 62, name: 'Poliwrath', type1: TypeList.agua, type2: TypeList.lucha),
    Pokemon(no: 63, name: 'Abra', type1: TypeList.psiquico),
    Pokemon(no: 64, name: 'Kadabra', type1: TypeList.psiquico),
    Pokemon(no: 65, name: 'Alakazam', type1: TypeList.psiquico),
    Pokemon(no: 66, name: 'Machop', type1: TypeList.lucha),
    Pokemon(no: 67, name: 'Machoke', type1: TypeList.lucha),
    Pokemon(no: 68, name: 'Machamp', type1: TypeList.lucha),
    Pokemon(
        no: 69,
        name: 'Bellsprout',
        type1: TypeList.planta,
        type2: TypeList.veneno),
    Pokemon(
        no: 70,
        name: 'Weepinbell',
        type1: TypeList.planta,
        type2: TypeList.veneno),
    Pokemon(
        no: 71,
        name: 'Victreebel',
        type1: TypeList.planta,
        type2: TypeList.veneno),
    Pokemon(
        no: 72,
        name: 'Tentacool',
        type1: TypeList.agua,
        type2: TypeList.veneno),
    Pokemon(
        no: 73,
        name: 'Tentacruel',
        type1: TypeList.agua,
        type2: TypeList.veneno),
    Pokemon(
        no: 74, name: 'Geodude', type1: TypeList.roca, type2: TypeList.tierra),
    Pokemon(
        no: 75, name: 'Graveler', type1: TypeList.roca, type2: TypeList.tierra),
    Pokemon(
        no: 76, name: 'Golem', type1: TypeList.roca, type2: TypeList.tierra),
    Pokemon(no: 77, name: 'Ponyta', type1: TypeList.fuego),
    Pokemon(no: 78, name: 'Rapidash', type1: TypeList.fuego),
    Pokemon(
        no: 79,
        name: 'Slowpoke',
        type1: TypeList.agua,
        type2: TypeList.psiquico),
    Pokemon(
        no: 80,
        name: 'Slowbro',
        type1: TypeList.agua,
        type2: TypeList.psiquico),
    Pokemon(
        no: 81,
        name: 'Magnemite',
        type1: TypeList.electrico,
        type2: TypeList.acero),
    Pokemon(
        no: 82,
        name: 'Magneton',
        type1: TypeList.electrico,
        type2: TypeList.acero),
    Pokemon(
        no: 83,
        name: "Farfetch'd",
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(
        no: 84, name: 'Doduo', type1: TypeList.normal, type2: TypeList.volador),
    Pokemon(
        no: 85,
        name: 'Dodrio',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(no: 86, name: 'Seel', type1: TypeList.agua),
    Pokemon(
        no: 87, name: 'Dewgong', type1: TypeList.agua, type2: TypeList.hielo),
    Pokemon(no: 88, name: 'Grimer', type1: TypeList.veneno),
    Pokemon(no: 89, name: 'Muk', type1: TypeList.veneno),
    Pokemon(no: 90, name: 'Shellder', type1: TypeList.agua),
    Pokemon(
        no: 91, name: 'Cloyster', type1: TypeList.agua, type2: TypeList.hielo),
    Pokemon(
        no: 92,
        name: 'Gastly',
        type1: TypeList.fantasma,
        type2: TypeList.veneno),
    Pokemon(
        no: 93,
        name: 'Haunter',
        type1: TypeList.fantasma,
        type2: TypeList.veneno),
    Pokemon(
        no: 94,
        name: 'Gengar',
        type1: TypeList.fantasma,
        type2: TypeList.veneno),
    Pokemon(no: 95, name: 'Onix', type1: TypeList.roca, type2: TypeList.tierra),
    Pokemon(no: 96, name: 'Drowzee', type1: TypeList.psiquico),
    Pokemon(no: 97, name: 'Hypno', type1: TypeList.psiquico),
    Pokemon(no: 98, name: 'Krabby', type1: TypeList.agua),
    Pokemon(no: 99, name: 'Kingler', type1: TypeList.agua),
    Pokemon(no: 100, name: 'Voltorb', type1: TypeList.electrico),
    Pokemon(no: 101, name: 'Electrode', type1: TypeList.electrico),
    Pokemon(
        no: 102,
        name: 'Exeggcute',
        type1: TypeList.planta,
        type2: TypeList.psiquico),
    Pokemon(
        no: 103,
        name: 'Exeggutor',
        type1: TypeList.planta,
        type2: TypeList.psiquico),
    Pokemon(no: 104, name: 'Cubone', type1: TypeList.tierra),
    Pokemon(no: 105, name: 'Marowak', type1: TypeList.tierra),
    Pokemon(no: 106, name: 'Hitmonlee', type1: TypeList.lucha),
    Pokemon(no: 107, name: 'Hitmonchan', type1: TypeList.lucha),
    Pokemon(no: 108, name: 'Lickitung', type1: TypeList.normal),
    Pokemon(no: 109, name: 'Koffing', type1: TypeList.veneno),
    Pokemon(no: 110, name: 'Weezing', type1: TypeList.veneno),
    Pokemon(
        no: 111, name: 'Rhyhorn', type1: TypeList.tierra, type2: TypeList.roca),
    Pokemon(
        no: 112, name: 'Rhydon', type1: TypeList.agua, type2: TypeList.hielo),
    Pokemon(no: 113, name: 'Chansey', type1: TypeList.normal),
    Pokemon(no: 114, name: 'Tangela', type1: TypeList.planta),
    Pokemon(no: 115, name: 'Kangaskhan', type1: TypeList.normal),
    Pokemon(no: 116, name: 'Horsea', type1: TypeList.agua),
    Pokemon(no: 117, name: 'Seadra', type1: TypeList.agua),
    Pokemon(no: 118, name: 'Goldeen', type1: TypeList.agua),
    Pokemon(no: 119, name: 'Seaking', type1: TypeList.agua),
    Pokemon(no: 120, name: 'Staryu', type1: TypeList.agua),
    Pokemon(
        no: 121,
        name: 'Starmie',
        type1: TypeList.agua,
        type2: TypeList.psiquico),
    Pokemon(
        no: 122,
        name: 'Mr. Mime',
        type1: TypeList.psiquico,
        type2: TypeList.hada),
    Pokemon(
        no: 123,
        name: 'Scyther',
        type1: TypeList.bicho,
        type2: TypeList.volador),
    Pokemon(
        no: 124, name: 'Jynx', type1: TypeList.hielo, type2: TypeList.psiquico),
    Pokemon(no: 125, name: 'Electabuzz', type1: TypeList.electrico),
    Pokemon(no: 126, name: 'Magmar', type1: TypeList.fuego),
    Pokemon(no: 127, name: 'Pinsir', type1: TypeList.bicho),
    Pokemon(no: 128, name: 'Tauros', type1: TypeList.normal),
    Pokemon(no: 129, name: 'Magikarp', type1: TypeList.agua),
    Pokemon(
        no: 130,
        name: 'Gyarados',
        type1: TypeList.agua,
        type2: TypeList.volador),
    Pokemon(
        no: 131, name: 'Lapras', type1: TypeList.agua, type2: TypeList.hielo),
    Pokemon(no: 132, name: 'Ditto', type1: TypeList.normal),
    Pokemon(no: 133, name: 'Eevee', type1: TypeList.normal),
    Pokemon(no: 134, name: 'Vaporeon', type1: TypeList.agua),
    Pokemon(no: 135, name: 'Jolteon', type1: TypeList.electrico),
    Pokemon(no: 136, name: 'Flareon', type1: TypeList.fuego),
    Pokemon(no: 137, name: 'Porygon', type1: TypeList.normal),
    Pokemon(
        no: 138, name: 'Omanyte', type1: TypeList.roca, type2: TypeList.agua),
    Pokemon(
        no: 139, name: 'Omastar', type1: TypeList.roca, type2: TypeList.agua),
    Pokemon(
        no: 140, name: 'Kabuto', type1: TypeList.roca, type2: TypeList.agua),
    Pokemon(
        no: 141, name: 'Kabutops', type1: TypeList.roca, type2: TypeList.agua),
    Pokemon(
        no: 142,
        name: 'Aerodactyl',
        type1: TypeList.roca,
        type2: TypeList.volador),
    Pokemon(no: 143, name: 'Snorlax', type1: TypeList.normal),
    Pokemon(
        no: 144,
        name: 'Articuno',
        type1: TypeList.hielo,
        type2: TypeList.volador),
    Pokemon(
        no: 145,
        name: 'Zapdos',
        type1: TypeList.electrico,
        type2: TypeList.volador),
    Pokemon(
        no: 146,
        name: 'Moltres',
        type1: TypeList.fuego,
        type2: TypeList.volador),
    Pokemon(no: 147, name: 'Dratini', type1: TypeList.dragon),
    Pokemon(no: 148, name: 'Dragonair', type1: TypeList.dragon),
    Pokemon(
        no: 149,
        name: 'Dragonite',
        type1: TypeList.dragon,
        type2: TypeList.volador),
    Pokemon(no: 150, name: 'Mewtwo', type1: TypeList.psiquico),
    Pokemon(no: 151, name: 'Mew', type1: TypeList.psiquico),
    Pokemon(no: 152, name: 'Chikorita', type1: TypeList.planta),
    Pokemon(no: 153, name: 'Bayleef', type1: TypeList.planta),
    Pokemon(no: 154, name: 'Meganium', type1: TypeList.planta),
    Pokemon(no: 155, name: 'Cyndaquil', type1: TypeList.fuego),
    Pokemon(no: 156, name: 'Quilava', type1: TypeList.fuego),
    Pokemon(no: 157, name: 'Typhlosion', type1: TypeList.fuego),
    Pokemon(no: 158, name: 'Totodile', type1: TypeList.agua),
    Pokemon(no: 159, name: 'Croconaw', type1: TypeList.agua),
    Pokemon(no: 160, name: 'Feraligatr', type1: TypeList.agua),
    Pokemon(no: 161, name: 'Sentret', type1: TypeList.normal),
    Pokemon(no: 162, name: 'Furret', type1: TypeList.normal),
    Pokemon(
        no: 163,
        name: 'Hoothoot',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(
        no: 164,
        name: 'Noctowl',
        type1: TypeList.normal,
        type2: TypeList.volador),
    Pokemon(
        no: 165,
        name: 'Ledyba',
        type1: TypeList.bicho,
        type2: TypeList.volador),
    Pokemon(
        no: 166,
        name: 'Ledian',
        type1: TypeList.bicho,
        type2: TypeList.volador),
    Pokemon(
        no: 167,
        name: 'Spinarak',
        type1: TypeList.bicho,
        type2: TypeList.veneno),
    Pokemon(
        no: 168,
        name: 'Ariados',
        type1: TypeList.bicho,
        type2: TypeList.veneno),
    Pokemon(
        no: 169,
        name: 'Crobat',
        type1: TypeList.veneno,
        type2: TypeList.volador),
    Pokemon(
        no: 170,
        name: 'Chinchou',
        type1: TypeList.agua,
        type2: TypeList.electrico),
    Pokemon(
        no: 171,
        name: 'Lanturn',
        type1: TypeList.agua,
        type2: TypeList.electrico),
    Pokemon(no: 172, name: 'Pichu', type1: TypeList.electrico),
    Pokemon(no: 173, name: 'Cleffa', type1: TypeList.hada),
    Pokemon(
        no: 174,
        name: 'Igglybuff',
        type1: TypeList.normal,
        type2: TypeList.hada),
    Pokemon(no: 175, name: 'Togepi', type1: TypeList.hada),
    Pokemon(
        no: 176,
        name: 'Togetic',
        type1: TypeList.hada,
        type2: TypeList.volador),
    Pokemon(
        no: 177,
        name: 'Natu',
        type1: TypeList.psiquico,
        type2: TypeList.volador),
    Pokemon(
        no: 178,
        name: 'Xatu',
        type1: TypeList.psiquico,
        type2: TypeList.volador),
    Pokemon(no: 179, name: 'Mareep', type1: TypeList.electrico),
    Pokemon(no: 180, name: 'Flaaffy', type1: TypeList.electrico),
    Pokemon(no: 181, name: 'Ampharos', type1: TypeList.electrico),
    Pokemon(no: 182, name: 'Bellossom', type1: TypeList.planta),
    Pokemon(
        no: 183, name: 'Marill', type1: TypeList.agua, type2: TypeList.hada),
    Pokemon(
        no: 184, name: 'Azumarill', type1: TypeList.agua, type2: TypeList.hada),
    Pokemon(no: 185, name: 'Sudowoodo', type1: TypeList.roca),
    Pokemon(no: 186, name: 'Politoed', type1: TypeList.agua),
    Pokemon(
        no: 187,
        name: 'Hoppip',
        type1: TypeList.planta,
        type2: TypeList.volador),
    Pokemon(
        no: 188,
        name: 'Skiploom',
        type1: TypeList.planta,
        type2: TypeList.volador),
    Pokemon(
        no: 189,
        name: 'Jumpluff',
        type1: TypeList.planta,
        type2: TypeList.volador),
    Pokemon(no: 190, name: 'Aipom', type1: TypeList.normal),
    Pokemon(no: 191, name: 'Sunkern', type1: TypeList.planta),
    Pokemon(no: 192, name: 'Sunflora', type1: TypeList.planta),
    Pokemon(
        no: 193, name: 'Yanma', type1: TypeList.bicho, type2: TypeList.volador),
    Pokemon(
        no: 194, name: 'Wooper	', type1: TypeList.agua, type2: TypeList.tierra),
    Pokemon(
        no: 195,
        name: 'Quagsire',
        type1: TypeList.agua,
        type2: TypeList.tierra),
    Pokemon(no: 196, name: 'Espeon', type1: TypeList.psiquico),
    Pokemon(no: 197, name: 'Umbreon', type1: TypeList.siniestro),
    Pokemon(
        no: 198,
        name: 'Murkrow',
        type1: TypeList.siniestro,
        type2: TypeList.volador),
    Pokemon(
        no: 199,
        name: 'Slowking',
        type1: TypeList.agua,
        type2: TypeList.psiquico),
    Pokemon(no: 200, name: 'Misdreavus', type1: TypeList.fantasma),
    Pokemon(no: 201, name: 'Unown', type1: TypeList.psiquico),
    Pokemon(no: 202, name: 'Wobbuffet', type1: TypeList.psiquico),
    Pokemon(
        no: 203,
        name: 'Girafarig',
        type1: TypeList.normal,
        type2: TypeList.psiquico),
    Pokemon(no: 204, name: 'Pineco', type1: TypeList.bicho),
    Pokemon(
        no: 205,
        name: 'Forretress',
        type1: TypeList.bicho,
        type2: TypeList.acero),
    Pokemon(no: 206, name: 'Dunsparce', type1: TypeList.normal),
    Pokemon(
        no: 207,
        name: 'Gligar',
        type1: TypeList.tierra,
        type2: TypeList.volador),
    Pokemon(
        no: 208,
        name: 'Steelix',
        type1: TypeList.acero,
        type2: TypeList.tierra),
    Pokemon(no: 209, name: 'Snubbull', type1: TypeList.hada),
    Pokemon(no: 210, name: 'Granbull', type1: TypeList.hada),
    Pokemon(
        no: 211,
        name: 'Qwilfish',
        type1: TypeList.agua,
        type2: TypeList.veneno),
    Pokemon(
        no: 212, name: 'Scizor', type1: TypeList.bicho, type2: TypeList.acero),
    Pokemon(
        no: 213, name: 'Shuckle', type1: TypeList.bicho, type2: TypeList.roca),
    Pokemon(
        no: 214,
        name: 'Heracross',
        type1: TypeList.bicho,
        type2: TypeList.lucha),
    Pokemon(
        no: 215,
        name: 'Sneasel',
        type1: TypeList.siniestro,
        type2: TypeList.hielo),
    Pokemon(no: 216, name: 'Teddiursa', type1: TypeList.normal),
    Pokemon(no: 217, name: 'Ursaring', type1: TypeList.normal),
    Pokemon(no: 218, name: 'Slugma', type1: TypeList.fuego),
    Pokemon(
        no: 219, name: 'Magcargo', type1: TypeList.fuego, type2: TypeList.roca),
    Pokemon(
        no: 220, name: 'Swinub', type1: TypeList.hielo, type2: TypeList.tierra),
    Pokemon(
        no: 221,
        name: 'Piloswine',
        type1: TypeList.hielo,
        type2: TypeList.tierra),
    Pokemon(
        no: 222, name: 'Corsola', type1: TypeList.agua, type2: TypeList.roca),
    Pokemon(no: 223, name: 'Remoraid', type1: TypeList.agua),
    Pokemon(no: 224, name: 'Octillery', type1: TypeList.agua),
    Pokemon(
        no: 225,
        name: 'Delibird',
        type1: TypeList.hielo,
        type2: TypeList.volador),
    Pokemon(
        no: 226,
        name: 'Mantine',
        type1: TypeList.agua,
        type2: TypeList.volador),
    Pokemon(
        no: 227,
        name: 'Skarmory',
        type1: TypeList.acero,
        type2: TypeList.volador),
    Pokemon(
        no: 228,
        name: 'Houndour',
        type1: TypeList.siniestro,
        type2: TypeList.fuego),
    Pokemon(
        no: 229,
        name: 'Houndoom',
        type1: TypeList.siniestro,
        type2: TypeList.fuego),
    Pokemon(
        no: 230, name: 'Kingdra', type1: TypeList.agua, type2: TypeList.dragon),
    Pokemon(no: 231, name: 'Phanpy', type1: TypeList.tierra),
    Pokemon(no: 232, name: 'Donphan', type1: TypeList.tierra),
    Pokemon(no: 233, name: 'Porygon2', type1: TypeList.normal),
    Pokemon(no: 234, name: 'Stantler', type1: TypeList.normal),
    Pokemon(no: 235, name: 'Smeargle', type1: TypeList.normal),
    Pokemon(no: 236, name: 'Tyrogue', type1: TypeList.lucha),
    Pokemon(no: 237, name: 'Hitmontop', type1: TypeList.lucha),
    Pokemon(
        no: 238,
        name: 'Smoochum',
        type1: TypeList.hielo,
        type2: TypeList.psiquico),
    Pokemon(no: 239, name: 'Elekid', type1: TypeList.electrico),
    Pokemon(no: 240, name: 'Magby', type1: TypeList.fuego),
    Pokemon(no: 241, name: 'Miltank', type1: TypeList.normal),
    Pokemon(no: 242, name: 'Blissey', type1: TypeList.normal),
    Pokemon(no: 243, name: 'Raikou', type1: TypeList.electrico),
    Pokemon(no: 244, name: 'Entei', type1: TypeList.fuego),
    Pokemon(no: 245, name: 'Suicune', type1: TypeList.agua),
    Pokemon(
        no: 246,
        name: 'Larvitar',
        type1: TypeList.roca,
        type2: TypeList.tierra),
    Pokemon(
        no: 247, name: 'Pupitar', type1: TypeList.roca, type2: TypeList.tierra),
    Pokemon(
        no: 248,
        name: 'Tyranitar',
        type1: TypeList.roca,
        type2: TypeList.siniestro),
    Pokemon(
        no: 249,
        name: 'Lugia',
        type1: TypeList.psiquico,
        type2: TypeList.volador),
    Pokemon(
        no: 250, name: 'Ho-Oh', type1: TypeList.fuego, type2: TypeList.volador),
    Pokemon(
        no: 251,
        name: 'Celebi',
        type1: TypeList.psiquico,
        type2: TypeList.planta),
  ];


  Future<void> initapp() async {
    if (!initialized){
    for (Pokemon p in pokedex) {
      try {
        ByteData bytes = await rootBundle
            .load('lib/Pokemons fotos/${p.no.toString().padLeft(3, '0')}.png');
        p.image = base64Encode(bytes.buffer
                  .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
      } catch (e) {
        print('The image doesnt exist');
      }
    }
    Box pocketbox = await Hive.openBox('pokemons');
    fakemon = pocketbox.get('fakedex')?.cast<Pokemon>() ?? <Pokemon>[];
    Box teambox = await Hive.openBox('equipospokemon');
    equipo = teambox.get('teams')?.cast<Team>() ?? <Team>[];
    initialized=true;
  }}
}
