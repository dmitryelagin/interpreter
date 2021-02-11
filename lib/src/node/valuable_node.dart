import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/valuable.dart';

abstract class ValuableNode<T> = Node with Valuable<T>;
