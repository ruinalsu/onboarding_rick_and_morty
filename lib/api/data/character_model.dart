/// Character model
class CharacterModel {
  /// ID of the character
  final int id;

  /// Name of the character
  final String? name;

  /// Status of the characters
  final String? status;

  /// Link to the charactre's image
  final String? image;

  /// Creates an instance of [CharacterModel]
  const CharacterModel({
    required this.id,
    this.name,
    this.status,
    this.image,
  });

  /// Parses [json] to instance of [CharacterModel]
  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'] as int,
        name: json['name'] as String?,
        status: json['status'] as String?,
        image: json['image'] as String?,
      );
}
