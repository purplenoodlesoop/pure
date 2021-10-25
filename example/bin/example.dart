import 'package:example/example.dart';
import 'package:pure/pure.dart';

void main(List<String> arguments) {
  void printResult(Object? result) => print('Result: $result');
  void printSection(Object? name) {
    const line = '----------';
    print('\n$line $name $line\n');
  }

  // printSection('Trampoline recursion');
  // trampolineRecursion().pipe(printResult);

  // printSection('Partial application');
  // partialApplication().pipe(printResult);

  // printSection('Memoization');
  // memoization().forEach(printResult);

  // printSection('Composition');
  // composition().pipe(printResult);

  final double someDouble = 3.5;
  final int someInt = 3;

  print(succ(someDouble) is double);
}
