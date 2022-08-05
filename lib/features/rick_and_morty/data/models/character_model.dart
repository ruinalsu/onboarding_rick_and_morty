import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';

/// Character model
class CharacterModel extends Character {
  /// ID of the character
  final int id;

  /// Creates an instance of [CharacterModel]
  const CharacterModel({
    required this.id,
    String? name,
    String? status,
    String? image,
  }) : super(name: name, status: status, image: image);

  /// Parses [json] to instance of [CharacterModel]
  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'] as int,
        name: json['name'] as String?,
        status: json['status'] as String?,
        image: json['image'] as String?,
      );
}
