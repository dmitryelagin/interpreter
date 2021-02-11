import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/precedence/precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

class Parser {
  Parser(Iterable<Precedence> precedences) {
    _precedences.addAll(precedences);
  }

  final _precedences = TraversableList<Iterator<Token>, Node>();

  Node call(Iterator<Token> tokens) => _precedences.apply(tokens).getValue();
}
