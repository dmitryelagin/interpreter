import 'package:interpreter/src/evaluation/number_evaluation.dart';
import 'package:interpreter/src/evaluation/number_operation_evaluation.dart';
import 'package:interpreter/src/evaluator.dart';
import 'package:interpreter/src/lexer.dart';
import 'package:interpreter/src/node/node_operation_type.dart';
import 'package:interpreter/src/parser.dart';
import 'package:interpreter/src/precedence/binary_precedence.dart';
import 'package:interpreter/src/precedence/recursive_precedence.dart';
import 'package:interpreter/src/precedence/valuable_precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_factory/integer_token_factory.dart';
import 'package:interpreter/src/token_factory/token_factory.dart';
import 'package:interpreter/src/token_parser/binary_token_parser.dart';
import 'package:interpreter/src/token_parser/integer_token_parser.dart';

class Interpreter {
  final _read = Lexer([
    IntegerTokenFactory(),
    TokenFactory(),
  ]);

  final _parse = Parser([
    BinaryPrecedence([
      BinaryTokenParser(
        (token) => token == Token.plus,
        NodeOperationType.add,
      ),
      BinaryTokenParser(
        (token) => token == Token.minus,
        NodeOperationType.subtract,
      ),
    ]),
    BinaryPrecedence([
      BinaryTokenParser(
        (token) => token == Token.star,
        NodeOperationType.multiply,
      ),
      BinaryTokenParser(
        (token) => token == Token.slash,
        NodeOperationType.divide,
      ),
    ]),
    ValuablePrecedence([
      IntegerTokenParser(),
    ]),
    RecursivePrecedence(
      (token) => token == Token.leftParenthesis,
      (token) => token == Token.rightParenthesis,
    ),
  ]);

  final _evaluate = Evaluator([
    NumberOperationEvaluation(),
    NumberEvaluation(),
  ]);

  num evaluate(String source) {
    final tokens = _read(source)..moveNext();
    final node = _parse(tokens);
    return _evaluate(node);
  }
}
