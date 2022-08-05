import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/features/app/di/app_scope.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen_modal.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/common/loading_dialog.dart';

/// Factory method for [CharactersScreenWidgetModel]
CharactersScreenWidgetModel initCharactersScreenWMFactory(BuildContext ctx) {
  final service = ctx.read<IAppScope>().charactersService;
  final loadingDialog = LoadingDialog(ctx);
  return CharactersScreenWidgetModel(
    model: CharactersScreenModel(service),
    loading: loadingDialog,
  );
}

/// Widget model for [CharactersScreen]
class CharactersScreenWidgetModel
    extends WidgetModel<CharactersScreen, CharactersScreenModel>
    implements ICharactersScreenWidgetModel {
  final _searchEditingController = TextEditingController();
  final LoadingDialog? _loading;
  final _charactersState = EntityStateNotifier<List<Character>>.value([]);

  @override
  ListenableState<EntityState<List<Character>>> get charactersState =>
      _charactersState;

  @override
  TextEditingController get searchEditingController => _searchEditingController;

  /// Creates an instance of [CharactersScreenWidgetModel]
  CharactersScreenWidgetModel({
    required CharactersScreenModel model,
    LoadingDialog? loading,
  })  : _loading = loading,
        super(model);

  @override
  void dispose() {
    _searchEditingController.dispose();
    super.dispose();
  }

  @override
  Future<void> fetchCharacters() async {
    final prevCharacters = _charactersState.value?.data;
    _loading?.show();
    try {
      final characters =
          await model.getCharacters(_searchEditingController.text);
      _charactersState.content(characters);
    } on Exception catch (e) {
      _charactersState.error(e, prevCharacters);
    } finally {
      _loading?.hide();
    }
  }
}

/// Inteface for [CharactersScreenWidgetModel]
abstract class ICharactersScreenWidgetModel extends IWidgetModel {
  /// Listenet for the characters state
  ListenableState<EntityState<List<Character>>> get charactersState;

  /// Text Editing Controller
  TextEditingController get searchEditingController;

  /// Fetchs list of characters
  Future<void> fetchCharacters();
}
