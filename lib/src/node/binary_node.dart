import 'package:interpreter/src/node/node.dart';

class BinaryNode implements Node {
  const BinaryNode(this.left, this.operation, this.right);

  final Node left;
  final BinaryNodeOperationType operation;
  final Node right;
}

enum BinaryNodeOperationType {
  add,
  subtract,
  multiply,
  divide,
}
