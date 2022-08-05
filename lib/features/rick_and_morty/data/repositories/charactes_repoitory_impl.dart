import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rick_and_morty/features/rick_and_morty/clients/api_client.dart';
import 'package:rick_and_morty/features/rick_and_morty/data/models/characters_response_model.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/repositories/characters_repository.dart';

/// Implemetatation of [ICharactersRepository] interface
class CharactersRepositoryImpl implements ICharactersRepository {
  final ApiClient _client;

  /// Creates an instance of [CharactersRepositoryImpl]
  CharactersRepositoryImpl(ApiClient client) : _client = client;

  /// Gets list of characters by [name]
  @override
  Future<List<Character>> getCharacters(String? name) async {
    var result = <Character>[];
    try {
      // TODO: temp solution for check loading dialog, should be removed
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final response = await _client.get('/character?name=${name ?? ''}');

      final parsedRes = CharactersResModel.fromJson(
        jsonDecode(response.data!) as Map<String, dynamic>,
      );
      result = parsedRes.results;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return result;
  }
}
