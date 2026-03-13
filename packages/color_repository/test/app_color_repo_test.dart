import 'package:color_repository/color_repository.dart';
import 'package:flutter_test/flutter_test.dart';

const int _kMinChannel = 0;
const int _kMaxChannel = 255;
const int _kIterations = 1000;

void main() {
  group('AppColorRepo', () {
    test('getRandomColor returns values in RGB range', () {
      final repo = AppColorRepo();

      for (int i = 0; i < _kIterations; i++) {
        final color = repo.getRandomColor();

        expect(color.red, inInclusiveRange(_kMinChannel, _kMaxChannel));
        expect(color.green, inInclusiveRange(_kMinChannel, _kMaxChannel));
        expect(color.blue, inInclusiveRange(_kMinChannel, _kMaxChannel));
      }
    });
  });
}
