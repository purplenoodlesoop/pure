import 'package:pure/pure.dart' hide isNotNull, isNull;
import 'package:test/test.dart';

void main() {
  group('partial application (apply)', () {
    test('apply2: fixes first argument, returns 1-arg function', () {
      int add(int a, int b) => a + b;
      final add10 = add.apply(10);

      expect(add10(5), 15);
      expect(add10(0), 10);
    });

    test('apply3: fixes first argument, returns 2-arg function', () {
      int sum3(int a, int b, int c) => a + b + c;
      final sum3With1 = sum3.apply(1);

      expect(sum3With1(2, 3), 6);
    });

    test('apply4: fixes first argument, returns 3-arg function', () {
      int sum4(int a, int b, int c, int d) => a + b + c + d;
      final sum4With1 = sum4.apply(1);

      expect(sum4With1(2, 3, 4), 10);
    });

    test('apply5: fixes first argument, returns 4-arg function', () {
      int sum5(int a, int b, int c, int d, int e) => a + b + c + d + e;
      final sum5With1 = sum5.apply(1);

      expect(sum5With1(2, 3, 4, 5), 15);
    });

    test('apply6: fixes first argument, returns 5-arg function', () {
      int sum6(int a, int b, int c, int d, int e, int f) =>
          a + b + c + d + e + f;
      final sum6With1 = sum6.apply(1);

      expect(sum6With1(2, 3, 4, 5, 6), 21);
    });

    test('apply7: fixes first argument, returns 6-arg function', () {
      int sum7(int a, int b, int c, int d, int e, int f, int g) =>
          a + b + c + d + e + f + g;
      final sum7With1 = sum7.apply(1);

      expect(sum7With1(2, 3, 4, 5, 6, 7), 28);
    });

    test('apply8: fixes first argument, returns 7-arg function', () {
      int sum8(int a, int b, int c, int d, int e, int f, int g, int h) =>
          a + b + c + d + e + f + g + h;
      final sum8With1 = sum8.apply(1);

      expect(sum8With1(2, 3, 4, 5, 6, 7, 8), 36);
    });

    test('apply9: fixes first argument, returns 8-arg function', () {
      int sum9(int a, int b, int c, int d, int e, int f, int g, int h,
              int i,) =>
          a + b + c + d + e + f + g + h + i;
      final sum9With1 = sum9.apply(1);

      expect(sum9With1(2, 3, 4, 5, 6, 7, 8, 9), 45);
    });

    test('applied function is reusable with different second args', () {
      String greet(String prefix, String name) => '$prefix, $name!';
      final sayHello = greet.apply('Hello');

      expect(sayHello('Alice'), 'Hello, Alice!');
      expect(sayHello('Bob'), 'Hello, Bob!');
    });

    test('apply is equivalent to curry + uncurry', () {
      int multiply(int a, int b) => a * b;

      final viaApply = multiply.apply(3)(7);
      final viaCurry = multiply.curry(3)(7);

      expect(viaApply, viaCurry);
    });

    test('chained applies reduce arity step by step', () {
      int sum3(int a, int b, int c) => a + b + c;
      final partial = sum3.apply(10);
      final partial2 = partial.apply(20);

      expect(partial2(30), 60);
    });
  });
}
