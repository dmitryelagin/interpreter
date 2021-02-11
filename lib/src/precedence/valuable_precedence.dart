import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/precedence/precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_parser/valuable_token_parser.dart';
import 'package:interpreter/src/traversable.dart';

class ValuablePrecedence extends Precedence {
  ValuablePrecedence(Iterable<ValuableTokenParser> parsers) {
    _parsers.addAll(parsers);
  }

  final _parsers = TraversableList<Token, Node>();

  @override
  TraverseResult<Node> apply(Iterator<Token> arg) {
    final result = _parsers.apply(arg.current);
    if (result.isFail) return applyWithNext(arg);
    if (result.isSuccess) arg.moveNext();
    return result;
  }
}
