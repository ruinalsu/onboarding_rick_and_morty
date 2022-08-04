import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen_modal.dart';

/// Factory method for [CharactersScreenWidgetModel]
CharactersScreenWidgetModel initCharactersScreenWMFactory(BuildContext ctx) {
  return CharactersScreenWidgetModel(CharactersScreenModel());
}

/// Widget model for [CharactersScreen]
class CharactersScreenWidgetModel
    extends WidgetModel<CharactersScreen, CharactersScreenModel>
    implements ICharactersScreenWidgetModel {
  /// Creates an instance of [CharactersScreenWidgetModel]
  CharactersScreenWidgetModel(CharactersScreenModel model) : super(model);

  @override
  void get() {}
}

/// Inteface for [CharactersScreenWidgetModel]
abstract class ICharactersScreenWidgetModel extends IWidgetModel {
  ///
  void get();
}
