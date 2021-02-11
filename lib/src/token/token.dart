import 'package:interpreter/src/token/token_type.dart';

class Token {
  const Token._(this.type);

  static const none = Token._(TokenType.none);
  static const endOfText = Token._(TokenType.endOfText);
  static const plus = Token._(TokenType.plus);
  static const float = Token._(TokenType.float);
  static const minus = Token._(TokenType.minus);
  static const star = Token._(TokenType.star);
  static const slash = Token._(TokenType.slash);
  static const leftParenthesis = Token._(TokenType.leftParenthesis);
  static const rightParenthesis = Token._(TokenType.rightParenthesis);

  final TokenType type;
}
