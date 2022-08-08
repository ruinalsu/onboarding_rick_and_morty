import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/api/data/character_model.dart';
import 'package:rick_and_morty/features/app/di/app_scope.dart';
import 'package:rick_and_morty/features/rick_and_morty/common/loading_dialog.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen_modal.dart';

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
  final _searchFocusNode = FocusNode();
  final LoadingDialog? _loading;
  final _charactersState = EntityStateNotifier<List<CharacterModel>>.value([]);

  @override
  ListenableState<EntityState<List<CharacterModel>>> get charactersState =>
      _charactersState;

  @override
  TextEditingController get searchEditingController => _searchEditingController;

  @override
  FocusNode get searchFocusNode => _searchFocusNode;

  /// Creates an instance of [CharactersScreenWidgetModel]
  CharactersScreenWidgetModel({
    required CharactersScreenModel model,
    LoadingDialog? loading,
  })  : _loading = loading,
        super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchCharacters();
    });
  }

  @override
  void dispose() {
    _searchEditingController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Future<void> fetchCharacters({bool loadMore = false}) async {
    final prevCharacters = _charactersState.value?.data;
    if (_searchFocusNode.hasFocus) {
      _searchFocusNode.unfocus();
    }
    _loading?.show();
    try {
      final characters = await model
          .getCharacters(_searchEditingController.text, loadMore: loadMore);
      if (loadMore) {
        prevCharacters?.addAll(characters);
        _charactersState.content(prevCharacters!);
      } else {
        _charactersState.content(characters);
      }
    } on Exception catch (e) {
      // TODO: handle No items custom exception in normal way
      // for all other cases show error dialog
      _charactersState.error(e, prevCharacters);
    } finally {
      _loading?.hide();
    }
  }
}

/// Inteface for [CharactersScreenWidgetModel]
abstract class ICharactersScreenWidgetModel extends IWidgetModel {
  /// Listenet for the characters state
  ListenableState<EntityState<List<CharacterModel>>> get charactersState;

  /// Text Editing Controller
  TextEditingController get searchEditingController;

  /// Focus Node for the search input
  FocusNode get searchFocusNode;

  /// Fetchs list of characters
  Future<void> fetchCharacters({bool loadMore});
}
