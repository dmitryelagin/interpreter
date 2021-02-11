import 'package:interpreter/src/evaluation/evaluation.dart';
import 'package:interpreter/src/node/binary_node.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/traversable.dart';

class BinaryNumberOperationEvaluation extends Evaluation<num> {
  @override
  TraverseResult<num> apply(Node arg) {
    if (arg is! BinaryNode) return applyWithNext(arg);
    final left = applyWithFirst(arg.left).getValue();
    final right = applyWithFirst(arg.right).getValue();
    switch (arg.operation) {
      case BinaryNodeOperationType.add:
        return TraverseResult.success(left + right);
      case BinaryNodeOperationType.subtract:
        return TraverseResult.success(left - right);
      case BinaryNodeOperationType.multiply:
        return TraverseResult.success(left * right);
      case BinaryNodeOperationType.divide:
        return TraverseResult.success(left / right);
    }
  }
}
