import 'package:interpreter/src/token/integer_token.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_factory/token_factory.dart';
import 'package:interpreter/src/traversable.dart';

class IntegerTokenFactory extends Traversable<RuneIterator, Token>
    implements TokenFactory {
  static final _charCodeValues = {
    for (var i = 0; i <= 9; i += 1) 48 + i: i,
  };

  static bool isApplicableCharCode(int code) =>
      _charCodeValues.containsKey(code);

  @override
  TraverseResult<Token> apply(RuneIterator arg) {
    if (!isApplicableCharCode(arg.current)) return applyWithNext(arg);
    var value = 0;
    do {
      value = value * 10 + _charCodeValues[arg.current]!;
      arg.moveNext();
    } while (isApplicableCharCode(arg.current));
    return TraverseResult.success(IntegerToken(value));
  }
}
