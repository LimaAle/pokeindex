
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:pokindex/app/shared/models/pokemon_model.dart';

class PokeRepository{
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemon() async{
    var response=await dio.get('/pokemon');
    
    List<PokemonModel> list=[];
    for (var item in (response.data['results'] as List)) {
      PokemonModel model = PokemonModel(name: toBeginningOfSentenceCase(item['name']) );
      list.add(model);
    }
    return list;
  }
}