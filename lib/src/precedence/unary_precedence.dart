import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/precedence/precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_parser/unary_token_parser.dart';
import 'package:interpreter/src/traversable.dart';

class UnaryPrecedence extends Precedence {
  UnaryPrecedence(Iterable<UnaryTokenParser> parsers) {
    _parsers.addAll(parsers);
  }

  final _parsers = TraversableList<UnaryTokenParserInput, Node>();

  @override
  TraverseResult<Node> apply(Iterator<Token> arg) {
    Node getNode() => apply(arg..moveNext()).getValue();
    final input = UnaryTokenParserInput(arg.current, getNode);
    final result = _parsers.apply(input);
    return result.isSuccess ? result : applyWithNext(arg);
  }
}
