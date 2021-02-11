import 'package:interpreter/src/evaluation/evaluation.dart';
import 'package:interpreter/src/node/binary_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/node/node_operation_type.dart';
import 'package:interpreter/src/traversable.dart';

class NumberOperationEvaluation extends Evaluation<num> {
  @override
  TraverseResult<num> apply(Node arg) {
    if (arg is! BinaryNode) return applyWithNext(arg);
    final left = applyWithFirst(arg.left).getValue();
    final right = applyWithFirst(arg.right).getValue();
    switch (arg.operation) {
      case NodeOperationType.add:
        return TraverseResult.success(left + right);
      case NodeOperationType.subtract:
        return TraverseResult.success(left - right);
      case NodeOperationType.multiply:
        return TraverseResult.success(left * right);
      case NodeOperationType.divide:
        return TraverseResult.success(left / right);
    }
  }
}
