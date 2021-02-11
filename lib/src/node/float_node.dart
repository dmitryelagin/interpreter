import 'package:interpreter/src/node/valuable_node.dart';

class FloatNode implements ValuableNode<double> {
  const FloatNode(this.value);

  @override
  final double value;
}
