import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:hive/hive.dart';
part 'team.g.dart';

@HiveType(typeId: 2)
class Team {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final List<Pokemon>? equipopokemon;

  Team({required this.name, this.equipopokemon});

  TempTeam tempTeamConverter(){
    return TempTeam(name: name, equipopokemon: equipopokemon);
  }
}
class TempTeam {
  String? name;
  List<Pokemon>? equipopokemon;

  TempTeam({this.name, this.equipopokemon});

  Team teamConverter(){
    return Team(name: name!, equipopokemon: equipopokemon);
  }
}


