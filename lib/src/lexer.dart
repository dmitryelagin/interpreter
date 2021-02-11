import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_factory/token_factory.dart';
import 'package:interpreter/src/traversable.dart';

class Lexer {
  Lexer(Iterable<TokenFactory> factories) {
    _factories.addAll(factories);
  }

  final _factories = TraversableList<RuneIterator, Token>();

  Iterator<Token> call(String source) =>
      _TokenIterator(_getTokens(source).iterator);

  Iterable<Token?> _getTokens(String source) sync* {
    final runeIterator = source.runes.iterator..moveNext();
    while (runeIterator.current > 0) {
      final token = _factories.apply(runeIterator).getValue();
      if (token != Token.none) yield token;
    }
  }
}

class _TokenIterator implements Iterator<Token> {
  _TokenIterator(this._tokensIterator);

  final Iterator<Token?> _tokensIterator;

  bool _canProceed = true;

  @override
  Token get current =>
      _tokensIterator.current ?? (_canProceed ? Token.none : Token.endOfText);

  @override
  bool moveNext() => _canProceed = _tokensIterator.moveNext();
}
