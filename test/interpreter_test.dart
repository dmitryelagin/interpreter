import 'package:interpreter/main.dart';
import 'package:test/test.dart';

void main() {
  final interprete = buildInterpreter();

  group('[Interpreter.evaluate]', () {
    test('should properly evaluate arithmetics', () {
      expect(interprete('3'), 3);
      expect(interprete('10 + 5'), 15);
      expect(interprete('7 - 3 + 2 - 1'), 5);
      expect(interprete('10 + 1 + 2 - 3 + 4 + 6 - 15'), 5);
      expect(interprete('7 * 4 / 2'), 14);
      expect(interprete('7 * 4 / 2 * 3'), 42);
      expect(interprete('10 * 4 * 2 * 3 / 8'), 30);
      expect(interprete('2 + 7 * 4'), 30);
      expect(interprete('7 - 8 / 4'), 5);
      expect(interprete('14 + 2 * 3 - 6 / 2'), 17);
      expect(interprete('10 - 4 * (2 + 3) / 10'), 8);
      expect(interprete('7 + 3 * (10 / (12 / ((3) + 1) - 1))'), 22);
      expect(interprete('7 + (((3 + 2)))'), 12);
      expect(interprete('(-3)'), -3);
      expect(interprete('- 3'), -3);
      expect(interprete('+ 3'), 3);
      expect(interprete('5 - - - + - 3'), 8);
      expect(interprete('5 - - - + - (3 + 4) - +2'), 10);
    });
  });
}
