import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/entities/character.dart';

/// Characters List widget
class CharactersList extends StatelessWidget {
  /// List of characters
  final List<Character> items;

  /// Creates an instance of [CharactersList] widget
  const CharactersList({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (_, index) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(items[index].image ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ColoredBox(
              color: const Color.fromRGBO(59, 123, 152, 0.6),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].name ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(items[index].status ?? ''),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
