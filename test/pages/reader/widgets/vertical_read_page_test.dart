import 'package:flutter_test/flutter_test.dart';
import 'package:hikari_novel_flutter/models/reader_initial_position_target.dart';
import 'package:hikari_novel_flutter/pages/reader/widgets/vertical_read_page.dart';

void main() {
  test('chapter start target restores vertical offset to top', () {
    expect(
      verticalRestoreOffset(
        initialPositionTarget: ReaderInitialPositionTarget.start,
        initialOffset: 320,
        maxScrollExtent: 1200,
      ),
      0,
    );
  });

  test('chapter end target restores vertical offset to bottom', () {
    expect(
      verticalRestoreOffset(
        initialPositionTarget: ReaderInitialPositionTarget.end,
        initialOffset: 0,
        maxScrollExtent: 1200,
      ),
      1200,
    );
  });

  test('current target keeps provided offset within bounds', () {
    expect(
      verticalRestoreOffset(
        initialPositionTarget: ReaderInitialPositionTarget.current,
        initialOffset: 320,
        maxScrollExtent: 1200,
      ),
      320,
    );
  });
}
