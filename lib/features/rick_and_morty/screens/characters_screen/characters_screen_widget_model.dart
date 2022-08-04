import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen_modal.dart';

CharactersScreenWidgetModel initCharactersScreenWMFactory(BuildContext ctx) {
  return CharactersScreenWidgetModel(CharactersScreenModel());
}

class CharactersScreenWidgetModel
    extends WidgetModel<CharactersScreen, CharactersScreenModel>
    implements ICharactersScreenWidgetModel {
  CharactersScreenWidgetModel(CharactersScreenModel model) : super(model);
}

abstract class ICharactersScreenWidgetModel extends IWidgetModel {}
