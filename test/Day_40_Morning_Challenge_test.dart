import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {});
  test('last winning move', () {
    expect(
        possibleMoves([
          [2, 3, 4],
          [1],
          []
        ]),
        []);
    expect(
        possibleMoves([
          [2, 3, 4],
          [],
          [1]
        ]),
        []);
    expect(
        possibleMoves([
          [1],
          [],
          [2, 3, 4]
        ]),
        [
          [
            [],
            [],
            [1, 2, 3, 4]
          ]
        ]);
  });
}
