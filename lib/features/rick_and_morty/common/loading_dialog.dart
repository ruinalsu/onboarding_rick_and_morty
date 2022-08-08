import 'package:flutter/material.dart';
import 'package:rick_and_morty/assets/colors/colors.dart';
import 'package:rick_and_morty/assets/strings/strings.dart';
import 'package:rick_and_morty/assets/themes/text_style.dart';

/// Loading dialog
class LoadingDialog {
  final BuildContext _ctx;
  bool _isVisible = false;

  /// Creates an instance of [LoadingDialog]
  LoadingDialog(BuildContext ctx) : _ctx = ctx;

  /// Shows loading dialog
  void show() {
    if (_isVisible) {
      return;
    }
    _isVisible = true;
    showDialog<void>(
      context: _ctx,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.black45,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  loadingStatusText,
                  style: textRegular16Secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Hides loading dialog if it is visible
  void hide() {
    if (_isVisible) {
      Navigator.of(_ctx).pop();
      _isVisible = false;
    }
  }
}
