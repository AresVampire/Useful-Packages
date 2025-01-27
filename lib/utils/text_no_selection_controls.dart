import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextNoSelectionControls extends TextSelectionControls {
  @override
  Widget buildHandle(
      BuildContext context, TextSelectionHandleType type, double textLineHeight,
      [void Function()? onTap]) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildToolbar(
    BuildContext context,
    Rect globalEditableRegion,
    double textLineHeight,
    Offset selectionMidpoint,
    List<TextSelectionPoint> endpoints,
    TextSelectionDelegate delegate,
    ValueListenable<ClipboardStatus>? clipboardStatus,
    Offset? lastSecondaryTapDownPosition,
  ) {
    return const SizedBox.shrink();
  }

  @override
  Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight) {
    return Offset.zero;
  }

  @override
  bool canCopy(TextSelectionDelegate delegate) {
    return false;
  }

  @override
  bool canCut(TextSelectionDelegate delegate) {
    return false;
  }

  @override
  bool canPaste(TextSelectionDelegate delegate) {
    return false;
  }

  @override
  bool canSelectAll(TextSelectionDelegate delegate) {
    return false;
  }

  @override
  Size getHandleSize(double textLineHeight) {
    return Size.zero;
  }
}
