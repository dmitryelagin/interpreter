import 'dart:async';
import 'dart:io';

import 'src/interpreter.dart';

Future<void> main(List<String> arguments) async {
  final interpreter = Interpreter();
  await stdin
      .map((charCodes) => String.fromCharCodes(charCodes))
      .map(interpreter.evaluate)
      .map((result) => [...result.toString().codeUnits, 10])
      .pipe(stdout);
}
