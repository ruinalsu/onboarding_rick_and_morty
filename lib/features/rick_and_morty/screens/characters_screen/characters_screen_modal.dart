import 'package:elementary/elementary.dart';
import 'package:rick_and_morty/api/data/character_model.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/features/rick_and_morty/services/characters_service.dart';

/// Elementary model for [CharactersScreen]
class CharactersScreenModel extends ElementaryModel {
  final ICharactersService _service;
  int _pages = 0;
  int _currentPage = 1;

  /// Creates an instance of [CharactersScreenModel]
  CharactersScreenModel(ICharactersService service) : _service = service;

  /// Gets list of characters by [name]
  Future<List<CharacterModel>> getCharacters(
    String? name, {
    bool loadMore = false,
  }) async {
    if (loadMore) {
      if (_currentPage >= _pages) {
        return <CharacterModel>[];
      }
      _currentPage++;
    } else {
      _currentPage = 1;
    }
    final charactersRes = await _service.getCharacters(name, _currentPage);
    _pages = charactersRes.info.pages;
    return charactersRes.results;
  }
}
