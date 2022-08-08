import 'package:flutter/material.dart';
import 'package:rick_and_morty/assets/strings/strings.dart';

/// Character Item widget
class CharacterItem extends StatelessWidget {
  /// Status of the character
  final String? status;

  /// Name of the character
  final String? name;

  /// Link to the image for the character
  final String? image;

  /// Creates an instance of [CharacterItem]
  const CharacterItem({
    Key? key,
    this.name = notApplicableText,
    this.status = unknownText,
    this.image = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image!),
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
                    name!,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(status!),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
