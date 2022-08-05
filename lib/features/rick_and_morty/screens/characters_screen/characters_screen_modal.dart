import 'package:elementary/elementary.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/characters.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/services/characters_service.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';

/// Elementary model for [CharactersScreen]
class CharactersScreenModel extends ElementaryModel {
  final CharactersService _service;
  int _pages = 0;
  int _currentPage = 1;

  /// Creates an instance of [CharactersScreenModel]
  CharactersScreenModel(CharactersService service) : _service = service;

  /// Gets list of characters by [name]
  Future<List<Character>> getCharacters(
    String? name, {
    bool loadMore = false,
  }) async {
    Characters chars;
    if (loadMore) {
      if (_currentPage < _pages) {
        _currentPage++;
        chars = await _service.getCharacters(name, _currentPage);
      } else {
        return <Character>[];
      }
    } else {
      _currentPage = 1;
      chars = await _service.getCharacters(name, _currentPage);
    }
    _pages = chars.pages;
    return chars.characters;
  }
}
