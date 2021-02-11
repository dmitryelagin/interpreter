import 'package:interpreter/src/interpreter.dart';
import 'package:test/test.dart';

void main() {
  final interpreter = Interpreter();

  group('[Interpreter.evaluate]', () {
    test('should properly evaluate arithmetics', () {
      expect(interpreter.evaluate('3'), 3);
      expect(interpreter.evaluate('10 + 5'), 15);
      expect(interpreter.evaluate('7 - 3 + 2 - 1'), 5);
      expect(interpreter.evaluate('10 + 1 + 2 - 3 + 4 + 6 - 15'), 5);
      expect(interpreter.evaluate('7 * 4 / 2'), 14);
      expect(interpreter.evaluate('7 * 4 / 2 * 3'), 42);
      expect(interpreter.evaluate('10 * 4 * 2 * 3 / 8'), 30);
      expect(interpreter.evaluate('2 + 7 * 4'), 30);
      expect(interpreter.evaluate('7 - 8 / 4'), 5);
      expect(interpreter.evaluate('14 + 2 * 3 - 6 / 2'), 17);
      expect(interpreter.evaluate('10 - 4 * (2 + 3) / 10'), 8);
      expect(interpreter.evaluate('7 + 3 * (10 / (12 / ((3) + 1) - 1))'), 22);
      expect(interpreter.evaluate('7 + (((3 + 2)))'), 12);
    });
  });
}
