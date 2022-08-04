import 'package:rick_and_morty/features/rick_and_morty/data/repositories/charactes_repoitory_impl.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character_entity.dart';

// ignore: comment_references
/// Intarface for [CharactersRepositoryImpl]
abstract class ICharactersRepository {
  /// Gets list of [CharacterEntity] by [name]
  Future<List<CharacterEntity>> getCharacters(String? name);
}
