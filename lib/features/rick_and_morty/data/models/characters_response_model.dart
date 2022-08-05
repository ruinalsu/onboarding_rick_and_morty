import 'package:rick_and_morty/features/rick_and_morty/data/models/character_model.dart';

/// Characters response model
class CharactersResModel {
  /// Info node of characters response
  final CharactersResInfoModel info;

  /// Results node of characters response
  final List<CharacterModel> results;

  /// Creates an instance of [CharactersResModel]
  CharactersResModel({
    required this.info,
    required this.results,
  });

  /// Parses [json] to instance of [CharactersResModel]
  factory CharactersResModel.fromJson(Map<String, dynamic> json) =>
      CharactersResModel(
        info: CharactersResInfoModel.fromJson(
          json['info'] as Map<String, dynamic>,
        ),
        results: (json['results'] as List)
            .map((dynamic e) =>
                CharacterModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

/// Characters response info model
class CharactersResInfoModel {
  /// Count of characters
  final int count;

  /// Count of pages
  final int pages;

  /// Creates an instance of [CharactersResInfoModel]
  CharactersResInfoModel({
    required this.count,
    required this.pages,
  });

  /// Parses [json] to instance of [CharactersResInfoModel]
  factory CharactersResInfoModel.fromJson(Map<String, dynamic> json) =>
      CharactersResInfoModel(
        count: json['count'] as int,
        pages: json['pages'] as int,
      );
}
