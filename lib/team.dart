import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:hive/hive.dart';
part 'team.g.dart';

@HiveType(typeId: 2)
class Team {
  @HiveField(0)
  final String name;
  @HiveField(1)
  List<Pokemon> equipopokemon = <Pokemon>[];

  Team({required this.name, required this.equipopokemon});

  TempTeam tempTeamConverter(){
    return TempTeam(name: name, equipopokemon: equipopokemon);
  }
}
class TempTeam {
  String? name;
  List<Pokemon> equipopokemon = <Pokemon>[];

  TempTeam({this.name, required this.equipopokemon});

  Team teamConverter(){
    return Team(name: name!, equipopokemon: equipopokemon);
  }
}


