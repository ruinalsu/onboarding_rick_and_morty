import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';

/// Characters entity
class Characters {
  /// Count of pages
  final int pages;

  /// List of characters
  final List<Character> characters;

  /// Creates an instance of [Characters]
  Characters({
    required this.characters,
    required this.pages,
  });
}
