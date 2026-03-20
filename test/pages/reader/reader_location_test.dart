import 'package:flutter_test/flutter_test.dart';
import 'package:hikari_novel_flutter/models/reader_direction.dart';
import 'package:hikari_novel_flutter/pages/reader/controller.dart';

void main() {
  test('parseReaderRouteLocation parses valid integer and falls back to zero', () {
    expect(parseReaderRouteLocation('18'), 18);
    expect(parseReaderRouteLocation(null), 0);
    expect(parseReaderRouteLocation('abc'), 0);
  });

  test('readerBuildLocation returns current state instead of re-reading route state', () {
    expect(
      readerBuildLocation(
        direction: ReaderDirection.leftToRight,
        currentIndex: 7,
        currentLocation: 99,
      ),
      7,
    );

    expect(
      readerBuildLocation(
        direction: ReaderDirection.upToDown,
        currentIndex: 7,
        currentLocation: 99,
      ),
      99,
    );
  });
}
