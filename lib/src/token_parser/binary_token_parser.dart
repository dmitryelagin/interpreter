import 'package:interpreter/src/node/binary_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

class BinaryTokenParser extends Traversable<BinaryTokenParserInput, Node> {
  BinaryTokenParser(this._isApplicable, this._operation);

  final BinaryNodeOperationType _operation;
  final bool Function(Token) _isApplicable;

  @override
  TraverseResult<Node> apply(BinaryTokenParserInput arg) =>
      _isApplicable(arg.token)
          ? TraverseResult.success(BinaryNode(arg.left, _operation, arg.right))
          : applyWithNext(arg);
}

class BinaryTokenParserInput {
  const BinaryTokenParserInput(this.token, this._getLeft, this._getRight);

  final Node Function() _getLeft;
  final Node Function() _getRight;

  final Token token;

  Node get left => _getLeft();
  Node get right => _getRight();
}
