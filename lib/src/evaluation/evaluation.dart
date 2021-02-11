import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/traversable.dart';

abstract class Evaluation<T> extends Traversable<Node, T> {}
