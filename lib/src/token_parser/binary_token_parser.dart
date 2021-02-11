import 'package:interpreter/src/node/binary_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/node/node_operation_type.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_parser/binary_token_parser_input.dart';
import 'package:interpreter/src/traversable.dart';

class BinaryTokenParser extends Traversable<BinaryTokenParserInput, Node> {
  BinaryTokenParser(this._isApplicable, this._operation);

  final NodeOperationType _operation;
  final bool Function(Token) _isApplicable;

  @override
  TraverseResult<Node> apply(BinaryTokenParserInput arg) =>
      _isApplicable(arg.token)
          ? TraverseResult.success(BinaryNode(arg.left, _operation, arg.right))
          : applyWithNext(arg);
}
