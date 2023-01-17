import 'package:angel_raul_alec_pokedex/model.dart';
import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/team.dart';
import 'package:angel_raul_alec_pokedex/type.dart';

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
}