import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/assets/themes/text_style.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/characters_screen/characters_screen_widget_model.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/widgets/characters_list.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/widgets/search_bar.dart';

/// Initialization screens
class CharactersScreen extends ElementaryWidget<ICharactersScreenWidgetModel> {
  /// Creates an instance of [CharactersScreen]
  const CharactersScreen({
    Key? key,
    WidgetModelFactory vmFactory = initCharactersScreenWMFactory,
  }) : super(vmFactory, key: key);

  @override
  Widget build(ICharactersScreenWidgetModel wm) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rick and Morty API',
                style: textRegular20Bold,
              ),
              SearchBar(
                onSearch: () => wm.fetchCharacters(),
                textController: wm.searchEditingController,
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 15,
                ),
              ),
              Text(
                'Characters',
                style: textRegular20Bold,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: EntityStateNotifierBuilder(
                  listenableEntityState: wm.charactersState,
                  builder: (_, characters) => CharactersList(
                    items: wm.charactersState.value!.data!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
