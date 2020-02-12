import 'package:mobx/mobx.dart';
import 'package:pokindex/app/modules/home/repositories/poke_repository.dart';
import 'package:pokindex/app/shared/models/pokemon_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemon;

  _HomeBase(this.repository) {
    pokemon = repository.getAllPokemon().asObservable();
  }
}
