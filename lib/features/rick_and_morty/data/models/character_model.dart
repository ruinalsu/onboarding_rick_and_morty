import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character_entity.dart';

/// Character model
class CharacterModel extends CharacterEntity {
  /// ID of character
  final int id;

  /// Name of character
  final String? name;

  /// Creates an instance of [CharacterModel]
  const CharacterModel({
    required this.id,
    this.name,
  }) : super(name: name);

  /// Parses [json] to instance of [CharacterModel]
  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'] as int,
        name: json['name'] as String?,
      );
}
