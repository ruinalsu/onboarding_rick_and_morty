import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/api/clients/api_client.dart';
import 'package:rick_and_morty/api/data/characters_response_model.dart';
import 'package:rick_and_morty/features/rick_and_morty/services/characters_service.dart';

/// Characters service
class CharactersService implements ICharactersService {
  /// Characters repository
  final ApiClient _client;

  /// Creates an instanse of [CharactersService]
  CharactersService(ApiClient client) : _client = client;

  /// Gets the list of [CharactersResModel] by [name] and [page]
  @override
  Future<CharactersResModel> getCharacters(String? name, int page) async {
    try {
      // TODO: temp solution for check loading dialog, should be removed
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final response =
          await _client.get('/character?name=${name ?? ''}&page=$page');

      final parsedRes = CharactersResModel.fromJson(
        jsonDecode(response.data!) as Map<String, dynamic>,
      );

      return parsedRes;
    } on Exception catch (ex) {
      if (ex is DioError && ex.response?.statusCode == 404) {
        throw Exception('No items');
      }
      // Logging exception and maybe rethrow
      rethrow;
    }
  }
}
