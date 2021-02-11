import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/node/node_operation_type.dart';

class BinaryNode implements Node {
  const BinaryNode(this.left, this.operation, this.right);

  final Node left;
  final NodeOperationType operation;
  final Node right;
}
