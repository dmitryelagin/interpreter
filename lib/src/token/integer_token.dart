import 'package:interpreter/src/token/token_type.dart';
import 'package:interpreter/src/token/valuable_token.dart';

class IntegerToken implements ValuableToken<int> {
  const IntegerToken(this.value);

  @override
  TokenType get type => TokenType.integer;

  @override
  final int value;
}
