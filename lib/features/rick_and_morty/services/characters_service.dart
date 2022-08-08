import 'package:rick_and_morty/api/data/characters_response_model.dart';

/// Characters service
abstract class ICharactersService {
  /// Gets the list fo characters by [name] and [page]
  Future<CharactersResModel> getCharacters(String? name, int page);
}
