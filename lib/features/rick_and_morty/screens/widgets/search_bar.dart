import 'package:flutter/material.dart';
import 'package:rick_and_morty/assets/colors/colors.dart';
import 'package:rick_and_morty/assets/themes/text_style.dart';

/// Search Bar widget
class SearchBar extends StatelessWidget {
  /// Padding for [SearchBar]
  final EdgeInsetsGeometry? padding;

  /// Callback for the search input handle
  final VoidCallback? onSearch;

  /// Search input text controller
  final TextEditingController? textController;

  /// Search input focus node
  final FocusNode? focusNode;

  /// Creates an instance of [SearchBar] widget
  const SearchBar({
    Key? key,
    this.padding,
    this.onSearch,
    this.textController,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              focusNode: focusNode,
              style: textRegular16Secondary,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                fillColor: white,
                filled: true,
                hintText: 'Search by name',
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: onSearch,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
