import 'package:interpreter/src/node/node.dart';

class UnaryNode implements Node {
  const UnaryNode(this.operation, this.node);

  final UnaryNodeOperationType operation;
  final Node node;
}

enum UnaryNodeOperationType {
  keep,
  negate,
}
