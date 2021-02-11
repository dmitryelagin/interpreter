import 'package:interpreter/src/char_code.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

class TokenFactory extends Traversable<RuneIterator, Token> {
  static const _charCodeTokens = {
    -1: Token.endOfText,
    CharCode.plus: Token.plus,
    CharCode.minus: Token.minus,
    CharCode.star: Token.star,
    CharCode.slash: Token.slash,
    CharCode.leftParenthesis: Token.leftParenthesis,
    CharCode.rightParenthesis: Token.rightParenthesis,
  };

  @override
  TraverseResult<Token> apply(RuneIterator arg) {
    final code = arg.current;
    final token = _charCodeTokens[arg.current];
    arg.moveNext();
    if (token != null) return TraverseResult.success(token);
    while (arg.current == code) {
      arg.moveNext();
    }
    return const TraverseResult.success(Token.none);
  }
}
