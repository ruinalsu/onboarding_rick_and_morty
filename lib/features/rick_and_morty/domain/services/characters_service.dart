import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character_entity.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/repositories/characters_repository.dart';

///
class CharactersService {
  /// Characters repository
  final ICharactersRepository _repository;

  /// Creates an instanse of [CharactersService]
  CharactersService(ICharactersRepository repository)
      : _repository = repository;

  /// Gets list of [CharacterEntity] by [name]
  Future<List<CharacterEntity>> getCharacters(String? name) {
    return _repository.getCharacters(name);
  }
}
