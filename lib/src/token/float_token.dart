import 'package:interpreter/src/token/token_type.dart';
import 'package:interpreter/src/token/valuable_token.dart';

class FloatToken implements ValuableToken<double> {
  const FloatToken(this.value);

  @override
  TokenType get type => TokenType.float;

  @override
  final double value;
}
