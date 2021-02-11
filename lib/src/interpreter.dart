import 'package:interpreter/src/evaluator.dart';
import 'package:interpreter/src/lexer.dart';
import 'package:interpreter/src/parser.dart';

class Interpreter {
  const Interpreter(this._read, this._parse, this._evaluate);

  final Lexer _read;
  final Parser _parse;
  final Evaluator _evaluate;

  num call(String source) {
    final tokens = _read(source)..moveNext();
    final node = _parse(tokens);
    return _evaluate(node);
  }
}
