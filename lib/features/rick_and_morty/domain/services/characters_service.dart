import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/characters.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/repositories/characters_repository.dart';

///
class CharactersService {
  /// Characters repository
  final ICharactersRepository _repository;

  /// Creates an instanse of [CharactersService]
  CharactersService(ICharactersRepository repository)
      : _repository = repository;

  /// Gets list of [Character] by [name]
  Future<Characters> getCharacters(String? name, int page) {
    return _repository.getCharacters(name, page);
  }
}
