import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hikari_novel_flutter/pages/reader/widgets/horizontal_read_page.dart';

void main() {
  test('layout signature changes when dual page mode changes', () {
    final singlePageSig = horizontalLayoutSignature(
      textLength: 1200,
      imageCount: 0,
      style: const TextStyle(fontSize: 24, height: 1.6),
      padding: const EdgeInsets.all(24),
      isDualPage: false,
      dualPageSpacing: 20,
      viewport: const Size(900, 600),
    );

    final dualPageSig = horizontalLayoutSignature(
      textLength: 1200,
      imageCount: 0,
      style: const TextStyle(fontSize: 24, height: 1.6),
      padding: const EdgeInsets.all(24),
      isDualPage: true,
      dualPageSpacing: 20,
      viewport: const Size(900, 600),
    );

    expect(singlePageSig, isNot(dualPageSig));
  });

  test('layout signature changes when viewport changes', () {
    final landscapeSig = horizontalLayoutSignature(
      textLength: 1200,
      imageCount: 0,
      style: const TextStyle(fontSize: 24, height: 1.6),
      padding: const EdgeInsets.all(24),
      isDualPage: true,
      dualPageSpacing: 20,
      viewport: const Size(900, 600),
    );

    final portraitSig = horizontalLayoutSignature(
      textLength: 1200,
      imageCount: 0,
      style: const TextStyle(fontSize: 24, height: 1.6),
      padding: const EdgeInsets.all(24),
      isDualPage: false,
      dualPageSpacing: 20,
      viewport: const Size(600, 900),
    );

    expect(landscapeSig, isNot(portraitSig));
  });

  test('restores reading position on relayout instead of jumping back to initIndex', () {
    final restoreProgress = horizontalLeafProgress(
      currentDisplayIndex: 3,
      rawPageCount: 12,
      wasDualPage: false,
    );

    final restoredIndex = horizontalRestoreDisplayIndex(
      shouldUseInitialIndex: false,
      initIndex: 0,
      contentChanged: false,
      restoreProgress: restoreProgress,
      currentDisplayIndex: 0,
      newRawPageCount: 16,
      isDualPage: false,
    );

    expect(restoredIndex, greaterThan(0));
  });

  test('uses initIndex only for the first layout', () {
    final initialIndex = horizontalRestoreDisplayIndex(
      shouldUseInitialIndex: true,
      initIndex: 4,
      contentChanged: false,
      restoreProgress: null,
      currentDisplayIndex: 0,
      newRawPageCount: 10,
      isDualPage: false,
    );

    final relayoutIndex = horizontalRestoreDisplayIndex(
      shouldUseInitialIndex: false,
      initIndex: 4,
      contentChanged: false,
      restoreProgress: 0.5,
      currentDisplayIndex: 0,
      newRawPageCount: 10,
      isDualPage: false,
    );

    expect(initialIndex, 4);
    expect(relayoutIndex, isNot(4));
  });
}
