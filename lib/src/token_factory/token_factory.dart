import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

class TokenFactory extends Traversable<RuneIterator, Token> {
  static const _charCodeTokens = {
    -1: Token.endOfText,
    43: Token.plus,
    45: Token.minus,
    42: Token.star,
    47: Token.slash,
    40: Token.leftParenthesis,
    41: Token.rightParenthesis,
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
