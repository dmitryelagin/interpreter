import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

abstract class Precedence extends Traversable<Iterator<Token>, Node> {}
