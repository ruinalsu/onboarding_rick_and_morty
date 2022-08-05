import 'package:rick_and_morty/features/rick_and_morty/data/repositories/charactes_repoitory_impl.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/characters.dart';

// ignore: comment_references
/// Intarface for [CharactersRepositoryImpl]
abstract class ICharactersRepository {
  /// Gets list of [Character] by [name]
  Future<Characters> getCharacters(String? name, int page);
}
