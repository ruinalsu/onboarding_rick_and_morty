import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/api/data/character_model.dart';
import 'package:rick_and_morty/features/rick_and_morty/screens/widgets/character_item.dart';

/// Characters List widget
class CharactersList extends StatelessWidget {
  /// List of characters
  final List<CharacterModel> items;

  /// Calback to handle load more functionality
  final VoidCallback? onLoadMore;

  /// Creates an instance of [CharactersList] widget
  const CharactersList({
    required this.items,
    this.onLoadMore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            scrollInfo is ScrollEndNotification) {
          if (kDebugMode) {
            print(scrollInfo.metrics.atEdge);
            onLoadMore?.call();
          }
        }
        return false;
      },
      child: GridView.builder(
        key: ObjectKey(items),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: items.length,
        itemBuilder: (_, index) => CharacterItem(
          name: items[index].name,
          status: items[index].status,
          image: items[index].image,
        ),
      ),
    );
  }
}
