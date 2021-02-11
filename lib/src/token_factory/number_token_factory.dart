import 'package:interpreter/src/char_code.dart';
import 'package:interpreter/src/token/float_token.dart';
import 'package:interpreter/src/token/integer_token.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_factory/token_factory.dart';
import 'package:interpreter/src/traversable.dart';

class NumberTokenFactory extends Traversable<RuneIterator, Token>
    implements TokenFactory {
  static final _charCodeValues = {
    for (var i = 0; i <= CharCode.integers.length - 1; i += 1)
      CharCode.zero + i: i,
  };

  static bool _isApplicableCharCode(int code) =>
      _isSpecialFloatCharCode(code) || _isIntegerCharCode(code);

  static bool _isIntegerCharCode(int code) => CharCode.integers.contains(code);

  static bool _isSpecialFloatCharCode(int code) => code == CharCode.dot;

  @override
  TraverseResult<Token> apply(RuneIterator arg) {
    if (!_isApplicableCharCode(arg.current)) return applyWithNext(arg);
    final integer = _getInteger(arg);
    if (!_isSpecialFloatCharCode(arg.current)) {
      return TraverseResult.success(IntegerToken(integer));
    }
    final decimal = _getInteger(arg..moveNext());
    return TraverseResult.success(FloatToken(integer + _toDecimal(decimal)));
  }

  int _getInteger(RuneIterator arg) {
    var value = 0;
    while (_isIntegerCharCode(arg.current)) {
      value = value * 10 + _charCodeValues[arg.current]!;
      arg.moveNext();
    }
    return value;
  }

  double _toDecimal(int integer) {
    var divider = 10;
    while (divider < integer) {
      divider *= 10;
    }
    return integer / divider;
  }
}
