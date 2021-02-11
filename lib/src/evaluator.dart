import 'package:interpreter/src/evaluation/evaluation.dart';
import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/traversable.dart';

class Evaluator {
  Evaluator(Iterable<Evaluation<num>> evaluations) {
    _evaluations.addAll(evaluations);
  }

  final _evaluations = TraversableList<Node, num>();

  num call(Node node) => _evaluations.apply(node).getValue();
}
