import 'package:interpreter/src/node/unary_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

class UnaryTokenParser extends Traversable<UnaryTokenParserInput, Node> {
  UnaryTokenParser(this._isApplicable, this._operation);

  final UnaryNodeOperationType _operation;
  final bool Function(Token) _isApplicable;

  @override
  TraverseResult<Node> apply(UnaryTokenParserInput arg) =>
      _isApplicable(arg.token)
          ? TraverseResult.success(UnaryNode(_operation, arg.node))
          : applyWithNext(arg);
}

class UnaryTokenParserInput {
  const UnaryTokenParserInput(this.token, this._getNode);

  final Node Function() _getNode;

  final Token token;

  Node get node => _getNode();
}
