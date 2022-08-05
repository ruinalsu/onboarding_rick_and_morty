import 'package:elementary/elementary.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/services/characters_service.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';

/// Elementary model for [CharactersScreen]
class CharactersScreenModel extends ElementaryModel {
  final CharactersService _service;

  /// Creates an instance of [CharactersScreenModel]
  CharactersScreenModel(CharactersService service) : _service = service;

  /// Gets list of characters by [name]
  Future<List<Character>> getCharacters(String? name) {
    return _service.getCharacters(name);
  }
}
