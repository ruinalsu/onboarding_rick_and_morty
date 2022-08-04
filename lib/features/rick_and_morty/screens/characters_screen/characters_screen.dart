import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen_widget_model.dart';

class CharactersScreen extends ElementaryWidget {
  CharactersScreen(
      {Key? key, WidgetModelFactory vmFactory = initCharactersScreenWMFactory})
      : super(vmFactory, key: key);

  @override
  Widget build(IWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
    );
  }
}
