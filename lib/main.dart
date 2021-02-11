import 'dart:async';
import 'dart:io';

import 'package:interpreter/src/evaluation/binary_number_operation_evaluation.dart';
import 'package:interpreter/src/evaluation/number_evaluation.dart';
import 'package:interpreter/src/evaluation/unary_number_operation_evaluation.dart';
import 'package:interpreter/src/evaluator.dart';
import 'package:interpreter/src/interpreter.dart';
import 'package:interpreter/src/lexer.dart';
import 'package:interpreter/src/node/binary_node.dart';
import 'package:interpreter/src/node/unary_node.dart';
import 'package:interpreter/src/parser.dart';
import 'package:interpreter/src/precedence/binary_precedence.dart';
import 'package:interpreter/src/precedence/recursive_precedence.dart';
import 'package:interpreter/src/precedence/unary_precedence.dart';
import 'package:interpreter/src/precedence/valuable_precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/token_factory/number_token_factory.dart';
import 'package:interpreter/src/token_factory/token_factory.dart';
import 'package:interpreter/src/token_parser/binary_token_parser.dart';
import 'package:interpreter/src/token_parser/float_token_parser.dart';
import 'package:interpreter/src/token_parser/integer_token_parser.dart';
import 'package:interpreter/src/token_parser/unary_token_parser.dart';

Future<void> main(List<String> arguments) async {
  final interprete = buildInterpreter();
  await stdin
      .map((charCodes) => String.fromCharCodes(charCodes))
      .map(interprete.call)
      .map((result) => [...result.toString().codeUnits, 10])
      .pipe(stdout);
}

Interpreter buildInterpreter() => Interpreter(
      Lexer([
        NumberTokenFactory(),
        TokenFactory(),
      ]),
      Parser([
        BinaryPrecedence([
          BinaryTokenParser(
            (token) => token == Token.plus,
            BinaryNodeOperationType.add,
          ),
          BinaryTokenParser(
            (token) => token == Token.minus,
            BinaryNodeOperationType.subtract,
          ),
        ]),
        BinaryPrecedence([
          BinaryTokenParser(
            (token) => token == Token.star,
            BinaryNodeOperationType.multiply,
          ),
          BinaryTokenParser(
            (token) => token == Token.slash,
            BinaryNodeOperationType.divide,
          ),
        ]),
        UnaryPrecedence([
          UnaryTokenParser(
            (token) => token == Token.plus,
            UnaryNodeOperationType.keep,
          ),
          UnaryTokenParser(
            (token) => token == Token.minus,
            UnaryNodeOperationType.negate,
          ),
        ]),
        ValuablePrecedence([
          IntegerTokenParser(),
          FloatTokenParser(),
        ]),
        RecursivePrecedence(
          (token) => token == Token.leftParenthesis,
          (token) => token == Token.rightParenthesis,
        ),
      ]),
      Evaluator([
        BinaryNumberOperationEvaluation(),
        UnaryNumberOperationEvaluation(),
        NumberEvaluation(),
      ]),
    );
