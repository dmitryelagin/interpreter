import 'package:interpreter/src/token/token.dart';
import 'package:interpreter/src/valuable.dart';

abstract class ValuableToken<T> = Token with Valuable<T>;
