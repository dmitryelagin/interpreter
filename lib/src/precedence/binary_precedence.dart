import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/precedence/precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_parser/binary_token_parser.dart';
import 'package:interpreter/src/token_parser/binary_token_parser_input.dart';
import 'package:interpreter/src/traversable.dart';

class BinaryPrecedence extends Precedence {
  BinaryPrecedence(Iterable<BinaryTokenParser> parsers) {
    _parsers.addAll(parsers);
  }

  final _parsers = TraversableList<BinaryTokenParserInput, Node>();

  @override
  TraverseResult<Node> apply(Iterator<Token> arg) {
    var result = applyWithNext(arg);
    Node getLeft() => result.getValue();
    Node getRight() => applyWithNext(arg..moveNext()).getValue();
    while (result.isSuccess) {
      final input = BinaryTokenParserInput(arg.current, getLeft, getRight);
      final updatedResult = _parsers.apply(input);
      if (updatedResult.isFail) break;
      result = updatedResult;
    }
    return result;
  }
}
