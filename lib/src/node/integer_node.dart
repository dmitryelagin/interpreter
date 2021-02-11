import 'package:interpreter/src/node/valuable_node.dart';

class IntegerNode implements ValuableNode<int> {
  const IntegerNode(this.value);

  @override
  final int value;
}
