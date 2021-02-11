import 'package:interpreter/src/evaluation/evaluation.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/node/valuable_node.dart';
import 'package:interpreter/src/traversable.dart';

class NumberEvaluation extends Evaluation<num> {
  @override
  TraverseResult<num> apply(Node arg) => arg is ValuableNode<num>
      ? TraverseResult.success(arg.value)
      : applyWithNext(arg);
}
