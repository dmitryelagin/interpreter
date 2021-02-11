import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/token/token.dart';

class BinaryTokenParserInput {
  const BinaryTokenParserInput(this.token, this._getLeft, this._getRight);

  final Node Function() _getLeft;
  final Node Function() _getRight;

  final Token token;

  Node get left => _getLeft();
  Node get right => _getRight();
}
