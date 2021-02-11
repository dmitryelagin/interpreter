import 'package:interpreter/src/node/float_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/token/float_token.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_parser/valuable_token_parser.dart';
import 'package:interpreter/src/traversable.dart';

class FloatTokenParser extends ValuableTokenParser {
  @override
  TraverseResult<Node> apply(Token arg) => arg is FloatToken
      ? TraverseResult.success(FloatNode(arg.value))
      : applyWithNext(arg);
}
