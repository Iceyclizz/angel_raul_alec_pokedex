import 'package:angel_raul_alec_pokedex/pokemon.dart';
import 'package:angel_raul_alec_pokedex/type.dart';

class Model{
  static final Model _model = Model._internal();

  factory Model() {
    return _model;
  }

  Model._internal();

  List<Pokemon> pokedex = [Pokemon(no: 1,name: 'Bulbasur', type1: TypeList.planta,type2: TypeList.veneno),];
  
}