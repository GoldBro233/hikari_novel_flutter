import 'package:flutter_test/flutter_test.dart';
import 'package:hikari_novel_flutter/pages/reader/widgets/horizontal_read_page.dart';

void main() {
  test('horizontalDisplayPageCount groups raw pages into spreads in dual-page mode', () {
    expect(horizontalDisplayPageCount(6, false), 6);
    expect(horizontalDisplayPageCount(6, true), 3);
    expect(horizontalDisplayPageCount(7, true), 4);
  });
}
