import 'package:example/example.dart';
import 'package:pure/pure.dart';

Future<void> main(List<String> arguments) async {
  void printResult(Object? result) => print('Result: $result');
  void printSection(Object? name) {
    const line = '----------';
    print('\n$line $name $line\n');
  }

  printSection('Trampoline recursion');
  trampolineRecursion().pipe(printResult);

  printSection('Partial application');
  partialApplication().pipe(printResult);

  printSection('Memoization');
  memoization().forEach(printResult);

  printSection('Composition');
  composition().pipe(printResult);

  printSection('Constant');
  constant().pipe(printResult);

  printSection('Nullable');
  await nullable().then(printResult);

  printSection('Flip');
  flip().pipe(printResult);
}
