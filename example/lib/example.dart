import 'package:pure/pure.dart';

String composition() {
  double intToDouble(int x) => x.toDouble();
  String doubleToString(double x) => x.toString();

  String intToStringApplication(int x) => doubleToString(intToDouble(x));
  final intToStringComposition = doubleToString.dot(intToDouble);
  String intToStringPipe(int x) => intToDouble(x).pipe(doubleToString);

  return intToStringApplication(1) +
      intToStringComposition(2) +
      intToStringPipe(3);
}

int constant() {
  int runWithCurrentDate(int Function(DateTime now) callback) =>
      callback(DateTime.now());

  return runWithCurrentDate(10.constant);
}

int curryUncurry() {
  int sum4(int a, int b, int c, int d) => a + b + c + d;

  return sum4.curry(1)(2).uncurry(3, 4);
}

int trampolineRecursion() {
  Tram<int> tramSum(int number, int sum) => number == 0
      ? Tram.done(sum)
      : Tram.call(() => tramSum(number - 1, sum + number));

  return tramSum.bounce(9999999, 0);
}

List<int> memoization() {
  int Function(int base) newCounter() {
    var counter = 0;
    return (base) => base + counter++;
  }

  final counter = newCounter().memoize();

  return [
    counter(0),
    counter(10),
    counter(0),
    counter(11),
  ];
}

int partialApplication() {
  int addQuaternary(int first, int second, int third, int fourth) =>
      first + second + third + fourth;
  int multiply(int first, int second) => first * second;

  final addToTen = addQuaternary.curry(8)(2).uncurry;
  final multiplyByTwo = multiply.apply(2);

  return addToTen(multiplyByTwo(5), multiplyByTwo(15));
}

Future<int?> nullable() {
  int add(int first, int second) => first + second;

  return Future<int?>.value(10).then(add.apply(90).nullable);
}

String flip() {
  String concatenate(String first, String second) => first + ' ' + second;

  return concatenate.flip('First', 'Second');
}
