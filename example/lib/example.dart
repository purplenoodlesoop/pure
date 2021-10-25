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
  int addTernary(int first, int second, int third) => first + second + third;
  int multiply(int first, int second) => first * second;

  final addToTen = addTernary.apply(10);
  final multiplyByTwo = multiply.apply(2);

  return addToTen(multiplyByTwo(5), multiplyByTwo(15));
}
