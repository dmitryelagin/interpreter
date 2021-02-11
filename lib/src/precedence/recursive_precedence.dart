import 'package:interpreter/src/node/node.dart';
import 'package:interpreter/src/precedence/precedence.dart';
import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/traversable.dart';

class RecursivePrecedence extends Precedence {
  RecursivePrecedence(this._isRecursionStart, this._isRecursionEnd);

  final bool Function(Token) _isRecursionStart;
  final bool Function(Token) _isRecursionEnd;

  @override
  TraverseResult<Node> apply(Iterator<Token> arg) {
    if (!_isRecursionStart(arg.current)) return applyWithNext(arg);
    final result = applyWithFirst(arg..moveNext());
    if (!_isRecursionEnd(arg.current)) return applyWithNext(arg);
    arg.moveNext();
    return result;
  }
}
