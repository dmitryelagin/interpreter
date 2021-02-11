import 'package:interpreter/src/evaluation/evaluation.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/node/unary_node.dart';
import 'package:interpreter/src/traversable.dart';

class UnaryNumberOperationEvaluation extends Evaluation<num> {
  @override
  TraverseResult<num> apply(Node arg) {
    if (arg is! UnaryNode) return applyWithNext(arg);
    final value = applyWithFirst(arg.node).getValue();
    switch (arg.operation) {
      case UnaryNodeOperationType.keep:
        return TraverseResult.success(value);
      case UnaryNodeOperationType.negate:
        return TraverseResult.success(-value);
    }
  }
}
