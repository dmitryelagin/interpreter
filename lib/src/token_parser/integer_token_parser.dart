import 'package:interpreter/src/node/integer_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/token/integer_token.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_parser/valuable_token_parser.dart';
import 'package:interpreter/src/traversable.dart';

class IntegerTokenParser extends ValuableTokenParser {
  @override
  TraverseResult<Node> apply(Token arg) => arg is IntegerToken
      ? TraverseResult.success(IntegerNode(arg.value))
      : applyWithNext(arg);
}
